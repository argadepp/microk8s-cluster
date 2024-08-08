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


variable "min" {
}

variable "desired" {
  
}

variable "max" {
  
}

variable "zones" {
  type = list(string)
  default = [ "ap-soyrh-1a","ap-south-1b" ]
}