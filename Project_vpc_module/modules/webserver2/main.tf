resource "aws_instance" "webserver2" {
  ami                    = "ami-0ec10929233384c7f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet_id
  user_data_base64       = base64encode(file("${path.module}/../../userdata1.sh"))
}