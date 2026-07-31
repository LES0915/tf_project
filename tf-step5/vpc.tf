# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${local.project}-VPC"
  }
}
# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${local.project}-IGW"
  }
}

# Public Subnets - Public ALB, NAT Gateway

# Private Application Subnets - Web, Was, Internal ALB

# Private DB Subnets - RDS

# Public Route Table/association 

# Nat Gateway - EIP

# Private App Route Table/association - Web, Was

# Private Db Route Table/association - RDS