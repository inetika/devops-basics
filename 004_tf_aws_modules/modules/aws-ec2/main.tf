provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "main" {
  name        = "allow_http_ssh"

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }  
}

resource "aws_instance" "main" {
  ami = "ami-0277b52859bac6f4b"
  instance_type = "t2.micro"
  # associate_public_ip_address = true
  key_name = "stef"
  security_groups = [ aws_security_group.main.name ]

  user_data = <<-EOF
  #!/bin/bash
  amazon-linux-extras install nginx1
  systemctl start nginx
  EOF   
}

output "aws-ip" {
  value = aws_instance.main.public_ip
}