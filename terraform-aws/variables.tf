variable "aws_region" { default = "us-east-1" }
variable "vpc_cidr"    { default = "10.0.0.0/16" }
variable "public_subnet_cidr" { default = "10.0.1.0/24" }
variable "private_subnet_cidr" { default = "10.0.2.0/24" }

variable "ami_id" {}
variable "db_user" { default = "admin" }
variable "db_pass" {}
variable "db_name" { default = "webappdb" }
variable "domain_name" {}

