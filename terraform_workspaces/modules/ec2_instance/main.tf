provider "aws" {
  region = "us-east-1"
}

variable "ami_value" {
  description = "This is the AMI Value"
  type = string
}

variable "instance_type_value" {
  description = "This is the instance_type_value"
  type = string
}

resource "aws_instance" "example" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
}