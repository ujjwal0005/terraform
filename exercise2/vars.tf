variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0a0e5d9c7acc336f1"
    us-east-2 = "ami-067df2907035c28c2"
  }
}