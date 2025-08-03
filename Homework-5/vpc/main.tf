resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.environment}-vpc"
    Environment = var.environment
  }
  
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[0]
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet-1"
    Environment = var.environment
  }
}

resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[1]
  availability_zone = var.azs[1]
  map_public_ip_on_launch = true
 
  tags = {
    Name = "${var.environment}-subnet-2"
    Environment = var.environment
  }

}

resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[2]
  availability_zone = var.azs[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-subnet-3"
    Environment = var.environment
    }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-igw"
    Environment = var.environment
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route" "internet_access" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.main3.id
  route_table_id = aws_route_table.public.id
}

