provider "aws" {
  region = var.region
}

# VPC
module "vpc" {
  source      = "../../modules/vpc"
  cidr_block  = var.cidr_block
  azs         = var.azs
  app_name    = var.app_name
  environment = var.environment
}

# Security Groups
module "sg" {
  source = "../../modules/security-group"
  vpc_id = module.vpc.vpc_id
}

# ALB
module "alb" {
  source         = "../../modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg         = module.sg.alb_sg
  app_name       = var.app_name
  environment    = var.environment
}

# EC2 ASG
module "ec2_asg" {
  source               = "../../modules/ec2-asg"
  vpc_id               = module.vpc.vpc_id
  subnets              = module.vpc.public_subnets
  alb_target_group_arn = module.alb.target_group_arn
  ec2_sg               = module.sg.ec2_sg
  instance_type        = var.instance_type
  ami                  = var.ami
  app_name             = var.app_name
  environment          = var.environment
}