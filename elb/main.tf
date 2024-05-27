resource "aws_lb" "test" {
  name = "test-alb"
  internal = false
  load_balancer_type = "application"
  subnets = toset(values(var.subnets))
}

resource "aws_lb_target_group" "test" {
  name = "test-alb-tg"
  port = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id = var.vpc
}

resource "aws_lb_listener" "test-listener" {
  load_balancer_arn = aws_lb.test.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}