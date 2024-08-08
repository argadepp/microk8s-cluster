module "controlplane" {
  source = "./modules/contolplane"
  environment = var.environment
  product = var.product
  instanceType = var.instanceType
}

module "slaves" {
  source = "./modules/slaves"
  product = var.product
  environment = var.environment
  instanceType = var.instanceType
  min = var.min
  desired = var.desired
  max = var.max
  zones = var.zones
}