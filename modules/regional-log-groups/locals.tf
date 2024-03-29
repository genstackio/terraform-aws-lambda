// following log group modules are only enable if region is present in var.log_regions.
// due to a limitation in Terraform, we can not do a loop/for_each on providers.

locals {
  lg_us           = contains(var.regions, "us")
  lg_eu           = contains(var.regions, "eu")
  lg_af           = contains(var.regions, "af")
  lg_ap           = contains(var.regions, "ap")
  lg_me           = contains(var.regions, "me")
  lg_sa           = contains(var.regions, "sa")
  lg_ca           = contains(var.regions, "ca")
  lg_us-east      = contains(var.regions, "us-east")
  lg_us-west      = contains(var.regions, "us-west")
  lg_eu-west      = contains(var.regions, "eu-west")
  lg_eu-central   = contains(var.regions, "eu-central")
  lg_eu-south     = contains(var.regions, "eu-south")
  lg_eu-north     = contains(var.regions, "eu-north")
  lg_me-south     = contains(var.regions, "me-south")
  lg_sa-east      = contains(var.regions, "sa-east")
  lg_af-south     = contains(var.regions, "af-south")
  lg_ap-east      = contains(var.regions, "ap-east")
  lg_ap-south     = contains(var.regions, "ap-south")
  lg_ap-northeast = contains(var.regions, "ap-northeast")
  lg_ap-southeast = contains(var.regions, "ap-southeast")
  lg_ca-central   = contains(var.regions, "ca-central")
}

locals {
  lg_us-east-1      = contains(var.regions, "us-east-1") || local.lg_us-east || local.lg_us
  lg_us-east-2      = contains(var.regions, "us-east-2") || local.lg_us-east || local.lg_us
  lg_us-west-1      = contains(var.regions, "us-west-1") || local.lg_us-west || local.lg_us
  lg_us-west-2      = contains(var.regions, "us-west-2") || local.lg_us-west || local.lg_us
  lg_af-south-1     = contains(var.regions, "af-south-1") || local.lg_af-south || local.lg_af
  lg_ap-east-1      = contains(var.regions, "ap-east-1") || local.lg_ap-east || local.lg_ap
  lg_ap-south-1     = contains(var.regions, "ap-south-1") || local.lg_ap-south || local.lg_ap
  lg_ap-northeast-1 = contains(var.regions, "ap-northeast-1") || local.lg_ap-northeast || local.lg_ap
  lg_ap-northeast-2 = contains(var.regions, "ap-northeast-2") || local.lg_ap-northeast || local.lg_ap
  lg_ap-northeast-3 = contains(var.regions, "ap-northeast-3") || local.lg_ap-northeast || local.lg_ap
  lg_ap-southeast-1 = contains(var.regions, "ap-southeast-1") || local.lg_ap-southeast || local.lg_ap
  lg_ap-southeast-2 = contains(var.regions, "ap-southeast-2") || local.lg_ap-southeast || local.lg_ap
  lg_eu-west-1      = contains(var.regions, "eu-west-1") || local.lg_eu-west || local.lg_eu
  lg_eu-west-2      = contains(var.regions, "eu-west-2") || local.lg_eu-west || local.lg_eu
  lg_eu-west-3      = contains(var.regions, "eu-west-3") || local.lg_eu-west || local.lg_eu
  lg_eu-south-1     = contains(var.regions, "eu-south-1") || local.lg_eu-south || local.lg_eu
  lg_eu-north-1     = contains(var.regions, "eu-north-1") || local.lg_eu-north || local.lg_eu
  lg_eu-central-1   = contains(var.regions, "eu-central-1") || local.lg_eu-central || local.lg_eu
  lg_ca-central-1   = contains(var.regions, "ca-central-1") || local.lg_ca-central || local.lg_ca
  lg_me-south-1     = contains(var.regions, "me-south-1") || local.lg_me-south || local.lg_me
  lg_sa-east-1      = contains(var.regions, "sa-east-1") || local.lg_sa-east || local.lg_sa
}
