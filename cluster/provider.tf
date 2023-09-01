

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  Version = "~>3.27.0"
}