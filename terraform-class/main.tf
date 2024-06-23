provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops-class" {
  

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  count = var.instance_count

  root_block_device {
    volume_size = var.storage_size
  }

  vpc_security_group_ids = [aws_security_group.devops-class.id]
  subnet_id             = var.subnet_id
}

resource "aws_security_group" "devops-class" {
  name        = "devops-security-group"
  description = "security group for the instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  vpc_id = var.vpc_id
}

output "instance_ips" {
  value = aws_instance.devops-class[*].public_ip
}

