resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.sg_id]
  subnets         = [var.subnet1_id, var.subnet2_id]

  tags = {
    Name = "web"
  }
}