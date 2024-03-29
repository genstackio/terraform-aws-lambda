//noinspection ConflictingProperties
resource "aws_iam_role_policy" "lambda" {
  count       = var.enabled ? 1 : 0
  name        = (128 < length("lambda-${var.name}-policy-${var.policy_name}")) ? null : "lambda-${var.name}-policy-${var.policy_name}"
  name_prefix = (128 >= length("lambda-${var.name}-policy-${var.policy_name}")) ? null : "lambda-policy-"
  policy      = data.aws_iam_policy_document.lambda.json
  role        = var.role_name
}