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
  default = 1
  
}

variable "max" {
  type = number
  default = 1
}

variable "dz" {
  type = number
  default = 1
}