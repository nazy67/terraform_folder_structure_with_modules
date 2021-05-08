  env = "qa"
  storage = 10
  skip_snapshot = "true"
  instance_class = "db.t2.micro"
  username = "qa_user"

  bucket = "terraform-nazy-state"
  key = "qa/rds.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-locks" 