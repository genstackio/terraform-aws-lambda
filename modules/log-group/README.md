# AWS Lambda Log Group Terraform module

Terraform module which creates an API Lambda log group on AWS.

## Usage

```hcl
module "lambda-log-group" {
  source    = "genstackio/lambda/aws//modules/log-group"
  
  // ...
}
```
