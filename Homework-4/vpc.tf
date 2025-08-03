resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr
<<<<<<< HEAD
  
  tags = local.common_tags
  
=======

  tags = local.common_tags
>>>>>>> 3792baaeb7a8e834a897c40538cf2d7c6e073f2a
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[0].cidr
  availability_zone = var.subnet[0].az
  map_public_ip_on_launch = var.subnet[0].public_ip

  tags = {
    Name = var.subnet[0].name
  }
}

resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[1].cidr
  availability_zone = var.subnet[1].az
  map_public_ip_on_launch = var.subnet[1].public_ip

  tags = {
    Name = var.subnet[1].name
  }

}

resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[2].cidr
  availability_zone = var.subnet[2].az
  map_public_ip_on_launch = var.subnet[2].public_ip

  tags = {
    Name = var.subnet[2].name
    }
}

resource "aws_subnet" "main4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[3].cidr
  availability_zone = var.subnet[3].az
  map_public_ip_on_launch = var.subnet[3].public_ip

  tags = {
    Name = var.subnet[3].name
    }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.route_tables[0]
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.route_tables[1]
  }
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
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.main4.id
  route_table_id = aws_route_table.private.id
}
