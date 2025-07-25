output "public-subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "private-subnet_id" {
  value = aws_subnet.private-subnet.id
}
