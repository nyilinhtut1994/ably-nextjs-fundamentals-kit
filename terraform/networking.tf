#Creating a new VPC
resource "aws_vpc" "vpc_1" {
  provider             = aws.main
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = var.name,
    Project     = var.project,
    Environment = var.environment
  }
}

#Creating an Internet GW
resource "aws_internet_gateway" "igw_1" {
  provider = aws.main
  vpc_id   = aws_vpc.vpc_1.id
  tags = {
    Name        = var.name,
    Project     = var.project,
    Environment = var.environment
  }
}

#Creating a subnet_ids
resource "aws_subnet" "public_subnet" {
  provider                = aws.main
  vpc_id                  = aws_vpc.vpc_1.id
  count                   = length(var.public_subnet_cidr_blocks)
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "ably_${count.index + 1}"
    Project     = var.project,
    Environment = var.environment
  }
}


#Creating a new route Table
resource "aws_route_table" "public" {
  provider = aws.main
  vpc_id   = aws_vpc.vpc_1.id

  tags = {
    Name        = var.name
    Project     = var.project,
    Environment = var.environment
  }
}

resource "aws_route" "public" {
  provider               = aws.main
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_1.id
}


# Associate the Route Table for the VPC
resource "aws_route_table_association" "public" {
  provider       = aws.main
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}


