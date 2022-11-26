output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "lb_endpoint" {
  value = aws_lb.alb.dns_name
}

output "lb_tg" {
  value = aws_lb_target_group.webservers_tg
}

