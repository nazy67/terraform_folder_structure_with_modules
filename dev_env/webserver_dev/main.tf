module "webserver_module" {
  source = "../../modules/webserver"

  env           = "dev"
  instance_type = "t2.micro"

  remote_state = {
    bucket = "terraform-nazy-state"
    key    = "dev/rds.tfstate"
    region = "us-east-1"
  }
}
resource "random_pet" "test" {
  count = 1
}

output "pet_name_value" {
  value = random_pet.test[*].id
}
