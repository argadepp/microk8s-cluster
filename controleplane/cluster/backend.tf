terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/${var.product}-cf.tfstate"
    region = "ap-south-1"
  }
}
