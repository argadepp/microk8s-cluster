variable "instanceType" {
  default = "t2.medium"
}

variable "product" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  default = "ap-south-1"
}