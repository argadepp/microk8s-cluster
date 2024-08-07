terraform {
  backend "s3" {
    bucket = "devoptech-dev-terraform-backend"
    key    = "cluster/controller.tfstate"
    region = "ap-south-1"
  }
}