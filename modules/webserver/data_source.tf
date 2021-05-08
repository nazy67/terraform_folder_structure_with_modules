data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "user_data" {
  template = filebase64("${path.module}/template_file/user_data.sh")
  vars = {
    env      = var.env
    address  = data.terraform_remote_state.rds.outputs.address
    username = data.terraform_remote_state.rds.outputs.username
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
