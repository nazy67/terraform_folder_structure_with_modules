resource "aws_autoscaling_group" "webserver_asg" {
  name = "${local.prefix}-asg"
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids 
  target_group_arns = [aws_lb_target_group.web_tg.arn] 
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  health_check_type = "ELB"
  force_delete         = true

  launch_template {
    id      = aws_launch_template.web_template.id
    version = aws_launch_template.web_template.latest_version
  }

  tag {
    key                 = "Name"
    value               = "${local.prefix}-asg"
    propagate_at_launch = true
  } 

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }   
  }
}

resource "aws_autoscaling_attachment" "web_alb_asg_attach" {
  alb_target_group_arn   = aws_lb_target_group.web_tg.arn
  autoscaling_group_name = aws_autoscaling_group.webserver_asg.id
}