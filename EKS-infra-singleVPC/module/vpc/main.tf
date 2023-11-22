#------------------------------------------------------------
#                             VPC
#------------------------------------------------------------
resource "aws_vpc" "main" {

  cidr_block                       = var.vpc_cidr
  assign_generated_ipv6_cidr_block = false
  enable_dns_hostnames             = false
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    Name = "eks-vpc"
  }
}

#------------------------------------------------------------
#                           subnets
#------------------------------------------------------------
resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = each.value["tags"]
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = each.value["tags"]
}

#------------------------------------------------------------
#                             IGW
#------------------------------------------------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks-igw"
  }
}

#------------------------------------------------------------
#                          EIP & NAT
#------------------------------------------------------------
resource "aws_eip" "nat_gw" {
  public_ipv4_pool = "amazon"
  domain           = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_gw.id
  subnet_id     = aws_subnet.public["subnet_a1"].id

  tags = {
    Name = "eks-nat"
  }

  depends_on = [aws_internet_gateway.main]
}

#------------------------------------------------------------
#                             RTB
#------------------------------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks-rtb-pub"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks-rtb-pri"
  }
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value["id"]
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "nat_gw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value["id"]
  route_table_id = aws_route_table.private.id
}