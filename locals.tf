locals {
  is_image = (null == var.file) && (null != var.image)
  is_s3    = (null == var.file) && !local.is_image && (null != var.s3_bucket)
  is_managed_s3 = local.is_s3 && ("=" != substr(var.s3_key, 0, 1))
  real_s3_key = local.is_s3 ? (local.is_managed_s3 ? var.s3_key : substr(var.s3_key, 1, length(var.s3_key) - 1)) : var.s3_key
}