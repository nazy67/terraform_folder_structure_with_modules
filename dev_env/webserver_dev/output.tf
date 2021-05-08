output "alb_dns" { 
  value = module.webserver_module.module_alb_dns
}
output "webserver_launch_template_name" {
  value = module.webserver_module.module_launch_template_name
  description = "the name of webserver launch template name"
} 
output "webserver_launch_template_id" {
  value = module.webserver_module.module_launch_template_id
  description = "the name of webserver launch template id"
} 
output "webserver_asg_name" {
  value = module.webserver_module.module_web_asg_name
  description = "the name of webserver asg"
} 
output "webserver_asg_arn" {
  value = module.webserver_module.module_web_asg_arn
  description = "webserver's asg id"
}
output "webserver_alb_arn" {
  value = module.webserver_module.module_web_alb_arn
  description = "webserver's load balancer arn"
}
output "webserver_alb_sg_name" {
  value = module.webserver_module.module_web_alb_sg_name
  description = "webserver's load balancer security group name"
}
output "target_group_name" {
   value =  module.webserver_module.module_tg_name
   description = "this is a webserver's target group name"
}
output "http_listener_arn"{
  value =  module.webserver_module.module_http_listeners_arn 
}