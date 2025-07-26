resource "aws_instance" "ec2" {
  ami           = "ami-04dd4500af104442f"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = "${var.customer}-${var.env_name}-new-ec2"
  }

}
