output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "lb_endpoint" {
  value = aws_lb.alb.dns_name
}

output "lb_tg_name" {
  value = aws_lb_target_group.web_servers_tg.name
}

