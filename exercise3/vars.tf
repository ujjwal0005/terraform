variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "USER" {
  default = "ec2-user"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0c8e23f950c7725b9"
    us-east-2 = "ami-067df2907035c28c2"
  }
}