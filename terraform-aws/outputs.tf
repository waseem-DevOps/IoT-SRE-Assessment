output "webapp_url" {
  value = "http://www.${var.domain_name}"
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

