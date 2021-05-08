terraform {
  backend "s3" {
    bucket = "terraform-nazy-state"
    key    = "__env__/webserver.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}