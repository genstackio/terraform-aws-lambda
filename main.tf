resource "aws_lambda_function" "lambda" {
  count = var.enabled ? 1 : 0
  //noinspection ConflictingProperties
  filename = var.file
  architectures = [var.architectures]
  //noinspection ConflictingProperties
  s3_bucket = local.is_s3 ? var.s3_bucket : null
  //noinspection ConflictingProperties
  s3_key = local.is_s3 ? local.real_s3_key : null
  //noinspection ConflictingProperties
  s3_object_version              = local.is_s3 ? var.s3_object_version : null
  source_code_hash               = (null != var.file) ? ((null == var.file_hash) ? ((true == var.check_file_hash) ? filebase64sha256(var.file) : null) : var.file_hash) : null
  image_uri                      = local.is_image ? var.image : null
  function_name                  = var.name
  role                           = aws_iam_role.lambda[0].arn
  handler                        = local.is_image ? null : var.handler
  runtime                        = local.is_image ? null : var.runtime
  timeout                        = var.timeout
  memory_size                    = var.memory_size
  depends_on                     = [module.lambda-policy, aws_cloudwatch_log_group.lambda[0]]
  tags                           = var.tags
  layers                         = var.layers
  publish                        = var.publish
  description                    = var.description
  package_type                   = (null != var.image) ? "Image" : "Zip"
  reserved_concurrent_executions = var.reserved

  dynamic "dead_letter_config" {
    iterator = v
    for_each = ("" != var.dlq_sns_topic) ? { dlq : var.dlq_sns_topic } : {}
    content {
      target_arn = v.value
    }
  }
  dynamic "environment" {
    iterator = v
    for_each = (0 != length(keys(var.variables))) ? { variables : var.variables } : {}
    content {
      variables = v.value
    }
  }
  dynamic "vpc_config" {
    iterator = v
    for_each = (0 != length(var.subnet_ids)) ? { x : { subnet_ids : var.subnet_ids, security_group_ids : var.security_group_ids } } : {}
    content {
      subnet_ids         = lookup(v.value, "subnet_ids")
      security_group_ids = lookup(v.value, "security_group_ids")
    }
  }
  dynamic "file_system_config" {
    iterator = v
    for_each = var.efs
    content {
      arn              = lookup(v.value, "arn")
      local_mount_path = lookup(v.value, "mount")
    }
  }
  dynamic "tracing_config" {
    iterator = v
    for_each = (null != var.tracing_mode) ? { x : { mode = var.tracing_mode } } : {}
    content {
      mode = lookup(v.value, "mode")
    }
  }
}

resource "aws_s3_object" "package-zip" {
  count  = local.is_managed_s3 ? 1 : 0
  bucket = var.s3_bucket
  key    = local.real_s3_key
  source = "${path.module}/default-packages/${var.runtime}.zip"
  etag   = filemd5("${path.module}/default-packages/${var.runtime}.zip")
  lifecycle {
    ignore_changes = [
      etag, source_hash
    ]
  }
}

//noinspection ConflictingProperties
resource "aws_iam_role" "lambda" {
  count              = var.enabled ? 1 : 0
  name               = (64 < length("lambda-${null != var.unique_name ? var.unique_name : var.name}-role")) ? null : "lambda-${null != var.unique_name ? var.unique_name : var.name}-role"
  name_prefix        = (64 >= length("lambda-${null != var.unique_name ? var.unique_name : var.name}-role")) ? null : "lambda-${null != var.unique_name ? var.unique_name : var.name}-role-"
  assume_role_policy = data.aws_iam_policy_document.lambda-assume-role.json
}

resource "aws_cloudwatch_log_group" "lambda" {
  count             = var.enabled ? 1 : 0
  name              = "/aws/lambda/${var.name}"
  retention_in_days = 14
}

module "lambda-policy" {
  source      = "./modules/policy"
  enabled     = var.enabled
  name        = null != var.unique_name ? var.unique_name : var.name
  policy_name = "lambda-${null != var.unique_name ? var.unique_name : var.name}"
  role_name   = (var.enabled && 0 < length(aws_iam_role.lambda)) ? aws_iam_role.lambda[0].name : null
  statements = concat(
    [
      {
        actions   = ["logs:CreateLogStream", "logs:PutLogEvents"],
        resources = ["arn:aws:logs:*:*:*"],
        effect    = "Allow"
      },
    ],
    var.policy_statements,
    ("" != var.dlq_sns_topic) ? [
      {
        actions   = ["SNS:Publish"],
        resources = [var.dlq_sns_topic],
        effect    = "Allow"
      },
    ] : [],
    length(var.subnet_ids) > 0 ? [
      {
        actions = [
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface"
        ]
        resources = ["*"]
        effect    = "Allow"
      }
    ] : []
  )
}
