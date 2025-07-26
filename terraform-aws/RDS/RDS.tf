resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private-subnet.id]  

  tags = {
    Name = "RDS Subnet Group"
  }
}

####sg of rds##############################

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow PostgreSQL access from web or private SG"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow PostgreSQL from internal EC2"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id, aws_security_group.private_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}


resource "aws_db_instance" "postgresql" {
  identifier         = "my-postgres-db"
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  storage_type       = "gp2"
  username           = "admin"
  password           = "askdfaslkdT%%E%$%^ETRRDWW#@"  
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false    
  skip_final_snapshot = true   

  tags = {
    Name = "MyPrivatePostgres"
  }
}

