resource "aws_lb" "alb" {
  name               = "application-lb"
  internal           = false
  load_balancer_type = "application"
  idle_timeout    = 400
  security_groups    = [var.security_groups]
  subnets            = [for subnet in var.private_subnets : subnet]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "webservers_tg" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  stickiness {
    type = "lb_cookie"
  }
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "alb-attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.webservers_tg.arn
  target_id        = var.webservers[count.index]
  port             = 80


}


resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webservers_tg.arn
  }
}




