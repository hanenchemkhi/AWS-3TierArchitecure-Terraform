resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.bastion_key.key_name
  associate_public_ip_address  = true
  subnet_id = var.subnet
  security_groups= [var.bastion-sg]
  tags = {
    "Name" = "Bastion"
  }
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file(var.ssh_public_key)
}