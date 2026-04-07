variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
variable "alb_target_group_arn" {}
variable "ec2_sg" {}
variable "instance_type" {}
variable "ami" {}
variable "app_name" {}
variable "environment" {}