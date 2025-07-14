resource "aws_instance" "web" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id = "subnet-09267fe210ac53646"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-1"
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id = "subnet-0af8a23414456fb83"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}

resource "aws_instance" "web3" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id = "subnet-0954d4150ddc2ed35"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}


