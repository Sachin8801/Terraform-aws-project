resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.app_name}-${var.environment}-lt"
  image_id      = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.ec2_sg]
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = var.subnets
  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }
  target_group_arns = [var.alb_target_group_arn]
}