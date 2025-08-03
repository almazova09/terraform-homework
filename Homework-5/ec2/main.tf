resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  tags = {
    Name = "${var.environment}-ec2"
    Enviroment = var.environment
  }
}
