module "webserver_module" {
  source = "../../modules/web_server"
  
  env = var.env
  instance_type = var.instance_type
  
  remote_state = {
      bucket = "terraform-nazy-state"
      key = "qa/rds.tfstate"   # change to dev 
      region = "us-east-1"
  }
}

output "alb_dns" {
  value = module.webserver_module.module_alb_dns
}
