variable "region" {
  description = "AWS region"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}