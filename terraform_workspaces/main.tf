provider "aws" {
  region = "us-east-1"
}

variable "ami_value" {
  description = "This is the AMI value"
}

variable "instance_type_value" {
  description = "This is the instance type value"
  type = map(string)

  default = {
    "dev" = "t3.micro"
    "stage" = "t3.small"
    "prod" = "t3.medium"
  }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = var.ami_value
  instance_type_value = lookup(var.instance_type_value, terraform.workspace, "t3.micro")
}