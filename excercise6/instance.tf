resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "dove-web" {
  #terrafrom dove instance 
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.dove-pub-1.id
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove_stack_sg.id]
  tags = {
    Name    = "Dove instance"
    Project = "Terraform"
  }

resource "aws_ebs_volume" "vole_4_dove" {
  availability_zone = var.ZONE1
  size              = 4

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "attach_ebs_volume" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vole_4_dove.id
  instance_id = aws_instance.dove-web.id
}


  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("dovekey") 
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.dove-instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.dove-instance.private_ip
}