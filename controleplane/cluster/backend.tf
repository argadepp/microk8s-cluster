terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/${var.product}.tfstate"
    region = "ap-south-1"
  }
}
