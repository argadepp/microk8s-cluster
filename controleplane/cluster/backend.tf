terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/controleplane.tfstate"
    region = "ap-south-1"
  }
}