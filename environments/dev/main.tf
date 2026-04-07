provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  cidr_block  = "10.0.0.0/16"
  azs         = ["ap-south-1", "ap-south-1"]
  app_name    = "bank"
  environment = "dev"
}

module "sg" {
  source = "../../modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "../../modules/alb"

  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg         = module.sg.alb_sg
  app_name       = "bank"
  environment    = "dev"
}

module "ec2_asg" {
  source = "../../modules/ec2-asg"

  ami              = "ami-0c02fb55956c7d316"
  instance_type    = "t2.micro"
  ec2_sg           = module.sg.ec2_sg
  private_subnets  = module.vpc.private_subnets
  target_group_arn = module.alb.target_group_arn
  app_name         = "bank"
}