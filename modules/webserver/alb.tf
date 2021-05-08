resource "aws_lb" "webserver_alb" {
  name               = "${local.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_alb_sg.id]
  subnets            = data.aws_subnet_ids.default.ids
  tags = {
    Name = "${local.prefix}-web_alb"
  }
}
resource "aws_lb_target_group" "web_tg" {
  name                          = "${local.prefix}-alb-tg"
  port                          = 80
  protocol                      = "HTTP"
  vpc_id                        = data.aws_vpc.default.id
  load_balancing_algorithm_type = "least_outstanding_requests"
  health_check {
    path    = "/"
    port    = 80
    matcher = "200"
  }
}

resource "aws_lb_listener" "http_listener" {
  depends_on        = []
  load_balancer_arn = aws_lb.webserver_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}