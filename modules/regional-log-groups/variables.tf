variable "name" {
  type = string
}
variable "enabled" {
  type    = bool
  default = true
}
variable "retention" {
  type    = number
  default = 14
}
variable "regions" {
  type    = list(string)
  default = []
}