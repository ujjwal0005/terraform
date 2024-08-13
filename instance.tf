provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tfinstance" {
  ami                    = "ami-0a0e5d9c7acc336f1"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "kops-key"
  vpc_security_group_ids = ["sg-04a97319ca6ea0609"]
  tags = {
    Name    = "TF instance"
    Project = "Terraform"
  }
}