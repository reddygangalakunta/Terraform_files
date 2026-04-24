provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver1" {
  ami                    = "ami-0ec10929233384c7f"
  instance_type          = "t3.micro"
}