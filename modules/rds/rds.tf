resource "aws_db_instance" "rds-db" {
  allocated_storage    = var.storage
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.5"
  instance_class       = var.instance_class
  identifier           = "${var.env}-rds"
  name                 = "my_rds"
  username             = var.username
  password             = random_password.password.result
  skip_final_snapshot = var.skip_snapshot 
  final_snapshot_identifier = var.skip_snapshot == true ? null : "${var.env}-rds-snapshot" # it checks if final snapshot has to be taken or not. this means if it's dev env make a final snapshot , if the other env dont make a snapshot
  vpc_security_group_ids    = [aws_security_group.rds_sg.id]
  apply_immediately         = true # flag to instruct the service to apply the change immediately 
  publicly_accessible       = var.env == "dev" ? true : false
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-sg"
  description = "allow from self and local laptop"

  tags = {
    Name = "${var.env}-rds-sg"
  }
}

resource "aws_security_group_rule" "self" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.rds_sg.id
}

resource "aws_security_group_rule" "local_laptop" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"] # your IP address
  security_group_id = aws_security_group.rds_sg.id
} 
