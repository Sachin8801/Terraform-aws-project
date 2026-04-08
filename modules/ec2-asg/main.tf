resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.app_name}-${var.environment}-lt"
  image_id      = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [var.ec2_sg]

  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install -y nginx || echo "NGINX INSTALL FAILED"

systemctl start nginx || echo "NGINX START FAILED"
systemctl enable nginx

echo "<h1>Welcome to ${var.app_name} - ${var.environment}</h1>" > /var/www/html/index.html
EOF
)

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.app_name}-${var.environment}-ec2"
    }
  }
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

  health_check_type         = "ELB"
  health_check_grace_period = 120

  tag {
    key                 = "Name"
    value               = "${var.app_name}-${var.environment}-asg"
    propagate_at_launch = true
  }
}