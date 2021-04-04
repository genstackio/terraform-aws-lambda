# AWS Lambda Regional Log Groups Terraform module

Terraform module which creates multiple Lambda log groups on AWS.

## Usage

```hcl
module "lambda-regional-log-groups" {
  source    = "genstackio/lambda/aws//modules/regional-log-groups"
  
  // ...
}
```
