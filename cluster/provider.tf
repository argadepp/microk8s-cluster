

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27.0"
    }
  }
required_version = ">=0.14.9"
}

provider "aws" {
  region  = "ap-south-1"
  Version = "~>3.27.0"
}