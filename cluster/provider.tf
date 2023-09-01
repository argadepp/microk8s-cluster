

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.6.2"
    }
  }
required_version = "1.4.0"
}

provider "aws" {
  region  = "ap-south-1"
  Version = "5.6.2"
}