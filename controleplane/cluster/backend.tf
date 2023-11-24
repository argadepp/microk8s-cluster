terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/worker2.tfstate"
    region = "ap-south-1"
  }
}
