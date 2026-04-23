provider "aws" {
    region = "ap-south-2"
}

resource "aws_instance" "terraform_instance" {
    ami = "ami-070e5bd3ff10324f8"
    instance_type = "t3.micro"
}