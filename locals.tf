locals {
  is_image = (null == var.file) && (null != var.image)
  is_s3    = (null == var.file) && !local.is_image && (null != var.s3_bucket)
}