module "rds_module" {
  source =  "../../modules/rds"

  env = var.env
  storage = 10
  skip_snapshot = var.skip_snapshot
  instance_class = var.instance_class
  username = var.username
}

output "username" {
  value = module.rds_module.module_username
}

output "address" {
  value = module.rds_module.module_address
}
