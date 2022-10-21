# VPC creation
resource "aws_vpc" "main" {
	#can be var
	cidr_block = "10.0.0.0/16"
	enable_dns_support = true
	enable_dns_hostnames = true
	instance_tenancy = "default"
	tags = {
		Name = "alex-main"
	}
}

# SUBNETS

# Public
resource "aws_subnet" "main-public-1" {
	vpc_id = aws_vpc.main.id
	#can be var
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = true
	#canbe var
	availability_zone = "eu-central-1a"
	tags = {
		Name = "alex-main-public-1"
	}
}
	
# Private
resource "aws_subnet" "main-private-1" {
	vpc_id = aws_vpc.main.id
	#can be var
	cidr_block = "10.0.2.0/24"
	map_public_ip_on_launch = false
	#can be var
	availability_zone = "eu-central-1a"
	tags = {
		Name = "alex-main-private-1"
	}
}

# IGW
resource "aws_internet_gateway" "main-gw" {
	vpc_id = aws_vpc.main.id
	tags = {
		Name = "alex-main-igw"
	}
}

# ROUTE TABLE
resource "aws_route_table" "main-public-rt" {
	vpc_id = aws_vpc.main.id
	route {
		#can be var
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.main-gw.id
	}
	tags = {
		Name = "alex-main-public-rt-1"
	}
}

# Route associations
resource "aws_route_table_association" "main-public-1-a" {
	subnet_id = aws_subnet.main-public-1.id
	route_table_id = aws_route_table.main-public-rt.id
}
