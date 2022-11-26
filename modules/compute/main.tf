resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.bastion_key.key_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet
  security_groups             = [var.bastion-sg]
  tags = {
    "Name" = "Bastion"
  }
}
resource "aws_instance" "webservers" {

  count = 2

  ami             = data.aws_ami.amzlinux2.id
  instance_type   = var.instance_type
  user_data       = file("${path.module}/app-install.sh")
  subnet_id       = var.private_subnets[count.index]
  security_groups = [var.webserver-sg]

  tags = {
    "Name" = "webserver-${count.index}"
  }
}


resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file(var.ssh_public_key)
}