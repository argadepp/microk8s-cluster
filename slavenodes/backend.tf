terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/slaves.tfstate"
    region = "ap-south-1"
  }
}