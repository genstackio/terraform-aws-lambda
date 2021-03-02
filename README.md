# AWS Lambda Terraform module

Terraform module which creates an API Lambda on AWS.

## Usage

```hcl
module "lambda" {
  source = "genstackio/lambda/aws"

  name   = "name-of-the-lambda"
  file   = "/path/to/the/package.zip"
}
```
