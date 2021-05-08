module "rds_module" {
  source =  "../../modules/rds"
  env = "dev"
  storage = 10
  skip_snapshot = "true"
  instance_class = "db.t2.micro"
  username = "dev_user"
}

output "username" {
  value = module.rds_module.module_username
}

output "address" {
  value = module.rds_module.module_address
}
