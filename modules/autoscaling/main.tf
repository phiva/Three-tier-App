resource "aws_launch_template" "lt-three-tier-app" {
  name_prefix     = "lt-for-asg-tta"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  user_data       = file("user-data.sh")

  network_interfaces {
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"
  }
  tags = {
    Name = "lt-webserver"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "asg-three-tier-app" {
    min_size = 1
    desired_capacity = 2
    max_size = 3
    vpc_zone_identifier = var.public_subnet_ids
    health_check_type = "EC2"
    health_check_grace_period = 300

    launch_template {
        id = aws_launch_template.lt-three-tier-app.id
        version = "$Latest"
    }

    tag {
    key                 = "Name"
    value               = "web-asg-instance"
    propagate_at_launch = true
  }
}