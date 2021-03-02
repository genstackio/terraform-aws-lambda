# AWS Lambda Policy Terraform module

Terraform module which creates an API Lambda Policy on AWS.

## Usage

```hcl
module "lambda-policy" {
  source    = "genstackio/lambda/aws//modules/policy"

  name      = "name-of-the-policy"
  role_name = "name-of-the-role-policy"
}
```
