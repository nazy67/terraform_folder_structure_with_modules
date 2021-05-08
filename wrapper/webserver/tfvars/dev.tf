  env = "dev" 
  instance_type = "t2.micro"
  

  bucket = "terraform-nazy-state"
  key = "dev/webserver.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-locks" 