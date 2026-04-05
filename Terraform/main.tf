provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "backend" {
  ami           = "ami-070e5bd3ff10324f8"
  instance_type = "t3.micro"
  key_name      = var.key_name

  security_groups = [aws_security_group.backend_sg.name]

  tags = {
    Name = "Backend"
  }
}

  resource "aws_instance" "frontend" {
  ami           = "ami-070e5bd3ff10324f8"
  instance_type = "t3.micro"
  key_name      = var.key_name

  security_groups = [aws_security_group.frontend_sg.name]

  tags = {
    Name = "Frontend"
  }
}

resource "aws_security_group" "backend_sg" {
  name = "backend-sg"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allow public access (assignment requirement)
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "frontend_sg" {
  name = "frontend-sg"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # public access
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



