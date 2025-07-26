# Public Subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr

  tags = {
    Name = "public-subnet-1"
  }
}

# Private Subnet
resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr

  tags = {
    Name = "private-subnet-1"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

# Route Table - Public
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public_rt"
  }
}

# Route Table Association - Public Subnet
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

# Elastic IP for NAT
resource "aws_eip" "main" {
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "NAT gw"
  }

  depends_on = [aws_internet_gateway.main]
}

# Route Table - Private
resource "aws_route_table" "private-nat-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "private_nat_rt"
  }
}

# Route Table Association - Private Subnet
resource "aws_route_table_association" "private-nat" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-nat-rt.id
}

