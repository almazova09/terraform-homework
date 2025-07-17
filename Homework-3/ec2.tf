data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "Ubuntu"
  }
}

data "aws_ami" "example" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250707.0-kernel-6.1-x86_64"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache1.sh")

  tags = {
    Name = "Amazon"
  }
}