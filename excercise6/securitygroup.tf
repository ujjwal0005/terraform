resource "aws_security_group" "dove-stack-sg" {
  name        = "dove-stack-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.dove.id

  tags = {
    Name = "dove-stack-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "dove-stack-sg_ipv4" {
  security_group_id = aws_security_group.dove-stack-sg.id
  cidr_ipv4         = var.MYIP
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.dove-stack-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.dove-stack-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}