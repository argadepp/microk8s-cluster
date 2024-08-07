module "controlplane" {
  source = "./modules/contolplane"
  environment = var.environment
  product = var.product
  instanceType = var.instanceType
}