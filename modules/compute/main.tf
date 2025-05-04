#Security group with public subnet and allowing HTTP and port 80
resource "aws_security_group" "lk-super" {
  name        = "lk-super"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public"
  }
}


#create an EC2 web server
resource "aws_instance" "lk-super-instance" {
  ami           = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"
  tags = {
    Name = "lk-super-instance"
  }
}


