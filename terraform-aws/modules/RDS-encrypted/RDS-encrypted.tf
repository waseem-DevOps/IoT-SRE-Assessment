resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_db_instance" "rds" {
  identifier         = var.db_identifier
  engine             = "postgres"
  instance_class     = var.instance_type
  allocated_storage  = 20
  username           = var.db_username
  password           = var.db_password
  skip_final_snapshot = true
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  multi_az           = false
  publicly_accessible = false
  storage_encrypted  = true
}
