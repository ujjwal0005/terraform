resource "aws_instance" "variable-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "kops-key"
  vpc_security_group_ids = ["sg-04a97319ca6ea0609"]
  tags = {
    Name    = "TF instance"
    Project = "Terraform"
  }
}