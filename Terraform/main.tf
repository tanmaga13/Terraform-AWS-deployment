provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-02774d409be696d81"
  instance_type = "t3.small"
  key_name      = var.key_name

  user_data = file("user_data.sh")

  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "Ares-App"
  }
}

resource "aws_security_group" "app_sg" {
  name = "ares-app-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
