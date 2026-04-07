variable "region" {
  default = "ap-south-1"
}

variable "app_name" {}
variable "environment" {}

variable "cidr_block" {}
variable "azs" {}

variable "instance_type" {}
variable "ami" {}

variable "enable_rds" {
  default = false
}