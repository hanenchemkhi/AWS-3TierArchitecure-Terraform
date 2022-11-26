output "webserver_sg" {
  value = aws_security_group.webserver_sg.id
}

output "bastion_sg" {
  value = aws_security_group.bastion_sg.id
}

output "alb_sg" {
  value = aws_security_group.alb_sg.id
}

output "data_sg" {
  value = aws_security_group.data_sg.id
}