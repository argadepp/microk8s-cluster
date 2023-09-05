variable "product" {
 type = string  
 default = "DevOpsTechs"
}

variable "env" {
  type = string
  default = "dev"  
}

variable "instType" {
    type = string
    default = "t2.medium"
}

variable "min" {
  type = number
  
}

variable "max" {
  type = number
}

variable "dz" {
  type = number
}