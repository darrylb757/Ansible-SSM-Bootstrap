variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "name_prefix" {
  type    = string
  default = "ansible-ssm-demo"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "allowed_cidr_for_http" {
  type    = string
  default = "0.0.0.0/0"
}
