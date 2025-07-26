resource "aws_route53_zone" "main" {
  name = "example.com"
}

output "zone_id" {
  value = aws_route53_zone.main.zone_id
}
