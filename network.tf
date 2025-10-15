# Use the default VPC
data "aws_vpc" "default" {
  default = true
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "PrivateSubnet"
  }
}

data "aws_route_tables" "default_vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "association.main"
    values = ["true"]
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = data.aws_route_tables.default_vpc.ids[0]
}
