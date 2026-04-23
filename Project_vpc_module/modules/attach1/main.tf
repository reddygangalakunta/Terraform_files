resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = var.tg_arn
  target_id        = var.instance_id
  port             = 80
}