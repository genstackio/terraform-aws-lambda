locals {
  is_image = (null == var.file) && (null != var.image)
}