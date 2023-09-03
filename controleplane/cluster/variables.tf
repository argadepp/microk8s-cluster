
variable "regiom" {
  type = string
}
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