### Lauch Template
resource "aws_launch_template" "web_template" {
  name_prefix   = "${local.prefix}-template-"  # when you close it with '-' the rest of the name will be created by aws and will be unique
  image_id      = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type
  
  lifecycle {
    create_before_destroy = true
  }
  
  user_data       = data.template_file.user_data.rendered
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
}

### Webserver Security Group
resource "aws_security_group" "webserver_sg" {
  name        = "${local.prefix}-sg"
  description = "Allow http inbound traffic to alb"
  tags = {
    Name  = "${local.prefix}-sg"
  }
}
resource "aws_security_group_rule" "webserver_http_ingress_from_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = aws_security_group.web_alb_sg.id
  security_group_id = aws_security_group.webserver_sg.id
}
resource "aws_security_group_rule" "webserver_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver_sg.id
}
### ALB Sec Group
resource "aws_security_group" "web_alb_sg" {
  name        = "${local.prefix}-app_lb_sg"
  description = "Allow http and https inbound traffic"
  
  tags = {
    Name  = "${local.prefix}-lb-sg"
  }
}
resource "aws_security_group_rule" "webserver_lb_sg_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_alb_sg.id
}
resource "aws_security_group_rule" "webserver_lb_sg_https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_alb_sg.id
}  
resource "aws_security_group_rule" "webserver_lb_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_alb_sg.id
}