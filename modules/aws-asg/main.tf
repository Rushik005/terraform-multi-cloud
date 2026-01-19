resource "aws_launch_template" "prodtemplate" {
  name_prefix   = var.name
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = [var.target_group_arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.prodtemplate.id
    version = "$Latest"
  }

  tag {
    key                 = "Environment"
    value               = var.tags["Environment"]
    propagate_at_launch = true
  }

  tag {
    key                 = "CostCenter"
    value               = var.tags["CostCenter"]
    propagate_at_launch = true
  }

  tag {
    key                 = "ManagedBy"
    value               = var.tags["ManagedBy"]
    propagate_at_launch = true
  }
}
