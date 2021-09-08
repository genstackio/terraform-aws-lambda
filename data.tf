data "aws_iam_policy_document" "lambda-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = concat(
      ["lambda.amazonaws.com"],
      var.assume_role_identifiers
      )
    }
  }
}
