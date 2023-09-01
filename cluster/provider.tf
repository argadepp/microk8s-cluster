
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27.0"
    }
  }

required_version = "1.4.0"
}

provider "aws" {
  region  = "ap-south-1"
        version = "~>3.27.0"
}