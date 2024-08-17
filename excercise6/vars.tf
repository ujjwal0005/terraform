variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}


variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "dovekey.pub"
}

variable "PRIV_KEY" {
  default = "dovekey"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0c8e23f950c7725b9"
    us-east-2 = "ami-067df2907035c28c2"
  }

}

variable MYIP {
  default = 27.34.65.88/32
}