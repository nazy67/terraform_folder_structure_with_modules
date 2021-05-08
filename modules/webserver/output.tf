output "module_launch_template_name" {
  value = aws_launch_template.web_template.name
  description = "the name of webserver launch template name"
} 
output "module_launch_template_id" {
  value = aws_launch_template.web_template.id
  description = "the name of webserver launch template id"
} 
output "module_web_asg_name" {
  value = aws_autoscaling_group.webserver_asg.name
  description = "the name of webserver asg"
} 
output "module_web_asg_arn" {
  value = aws_autoscaling_group.webserver_asg.arn
  description = "webserver's asg id"
}
output "module_web_alb_arn" {
  value = aws_lb.webserver_alb.arn
  description = "webserver's load balancer arn"
}
output "module_web_alb_sg_name" {
  value = aws_security_group.web_alb_sg.name
  description = "webserver's load balancer security group name"
}
output "module_tg_name" {
   value =  aws_lb_target_group.web_tg.name
   description = "this is a webserver's target group name"
}
output "module_http_listeners_arn"{
  value =  aws_lb_listener.http_listener.arn 
}
output "module_alb_dns" { 
  value = aws_lb.webserver_alb.dns_name
}