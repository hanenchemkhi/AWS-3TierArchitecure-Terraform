output "bastion-ip" {
  value = aws_instance.bastion.public_ip
}

output "webservers" {
  value = [aws_instance.webservers[0].id, aws_instance.webservers[1].id]
}