locals {
  statements = concat(
  var.statements,
  (0 != length(var.actions)) ? [{actions: var.actions, resources: var.resources}] : []
  )
}