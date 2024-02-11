
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }

}

provider "aws" {
  region  = var.region
  assume_role {
    role_arn = "arn:aws:iam::734522607489:role/github-action"
  }
}
