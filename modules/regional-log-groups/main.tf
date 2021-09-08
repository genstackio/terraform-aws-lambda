module "log-group-us-east-1" {
  source    = "../log-group"
  enabled   = local.lg_us-east-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.us-east-1 }
}
module "log-group-us-east-2" {
  source    = "../log-group"
  enabled   = local.lg_us-east-2
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.us-east-2 }
}
module "log-group-us-west-1" {
  source    = "../log-group"
  enabled   = local.lg_us-west-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.us-west-1 }
}
module "log-group-us-west-2" {
  source    = "../log-group"
  enabled   = local.lg_us-west-2
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.us-west-2 }
}
/*
module "log-group-af-south-1" {
  source    = "../log-group"
  enabled   = local.lg_af-south-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.af-south-1 }
}
module "log-group-ap-east-1" {
  source    = "../log-group"
  enabled   = local.lg_ap-east-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-east-1 }
}
*/
module "log-group-ap-south-1" {
  source    = "../log-group"
  enabled   = local.lg_ap-south-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-south-1 }
}
module "log-group-ap-northeast-1" {
  source    = "../log-group"
  enabled   = local.lg_ap-northeast-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-northeast-1 }
}
module "log-group-ap-northeast-2" {
  source    = "../log-group"
  enabled   = local.lg_ap-northeast-2
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-northeast-2 }
}
module "log-group-ap-northeast-3" {
  source    = "../log-group"
  enabled   = local.lg_ap-northeast-3
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-northeast-3 }
}
module "log-group-ap-southeast-1" {
  source    = "../log-group"
  enabled   = local.lg_ap-southeast-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-southeast-1 }
}
module "log-group-ap-southeast-2" {
  source    = "../log-group"
  enabled   = local.lg_ap-southeast-2
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ap-southeast-2 }
}
module "log-group-ca-central-1" {
  source    = "../log-group"
  enabled   = local.lg_ca-central-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.ca-central-1 }
}
module "log-group-eu-central-1" {
  source    = "../log-group"
  enabled   = local.lg_eu-central-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.eu-central-1 }
}
module "log-group-eu-west-1" {
  source    = "../log-group"
  enabled   = local.lg_eu-west-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.eu-west-1 }
}
module "log-group-eu-west-2" {
  source    = "../log-group"
  enabled   = local.lg_eu-west-2
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.eu-west-2 }
}
module "log-group-eu-west-3" {
  source    = "../log-group"
  enabled   = local.lg_eu-west-3
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.eu-west-3 }
}
/*
module "log-group-eu-south-1" {
  source    = "../log-group"
  enabled   = local.lg_eu-south-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.eu-south-1 }
}
*/
module "log-group-eu-north-1" {
  source    = "../log-group"
  enabled   = local.lg_eu-north-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.eu-north-1 }
}
/*
module "log-group-me-south-1" {
  source    = "../log-group"
  enabled   = local.lg_me-south-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.me-south-1 }
}
*/
module "log-group-sa-east-1" {
  source    = "../log-group"
  enabled   = local.lg_sa-east-1
  name      = "us-east-1.${var.name}"
  retention = var.retention
  providers = { aws = aws.sa-east-1 }
}
