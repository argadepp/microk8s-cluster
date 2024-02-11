terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/controller.tfstate"
    region = "ap-south-1"
  }
}
