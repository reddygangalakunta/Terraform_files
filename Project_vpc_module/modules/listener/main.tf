resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.alb_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = var.tg_arn
    type             = "forward"
  }
}