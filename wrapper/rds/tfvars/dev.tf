  env = "dev"
  storage = 12
  skip_snapshot = "true"
  instance_class = "db.t2.micro"
  username = "dev_user"

  bucket = "terraform-nazy-state"
  key = "dev/rds.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-locks" 