variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "rds_instance_type" {
  default = "db.t3.micro"
}
variable "db_name" {}
variable "username" {}
variable "password" {
  sensitive = true
}
variable "environment" {}