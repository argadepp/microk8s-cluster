terraform {
  backend "s3" {
    bucket = "terraform-backend-pratik"
    key    = "cluster/worker.tfstate"
    region = "ap-south-1"
  }
}
