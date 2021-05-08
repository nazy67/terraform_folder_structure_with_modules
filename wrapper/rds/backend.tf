terraform {
  backend "s3" {
  bucket = "terraform-nazy-state"
  key = "__env__/rds.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-locks"
  } 
}