provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}

module "rds" {
  source = "./modules/rds"
  private_subnet_id = module.vpc.private_subnet_id
  sg_id             = module.vpc.sg_id
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  private_subnet_id = module.vpc.private_subnet_id
  sg_id             = module.vpc.sg_id
  iam_profile       = module.iam.instance_profile
}

module "lambda" {
  source     = "./modules/lambda"
  rds_host   = module.rds.rds_endpoint
  db_user    = var.db_user
  db_pass    = var.db_pass
  db_name    = var.db_name
}

module "apigateway" {
  source       = "./modules/apigateway"
  lambda_arn   = module.lambda.lambda_arn
}

resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"
  alias {
    name                   = module.apigateway.api_gateway_url
    zone_id                = module.apigateway.api_zone_id
    evaluate_target_health = false
  }
}

