terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>4"
    }
  }

  required_version = ">=0.14.9"

}

provider "aws" {
  region  = "ap-south-1"
  Version = "~>4"
}