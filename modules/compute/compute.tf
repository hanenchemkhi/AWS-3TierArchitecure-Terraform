# EC2 Instance
/*resource "aws_instance" "mybastion" {
  ami = data.aws_ami.amzlinux2.id 
  instance_type = var.instance_type
  user_data = file("${path.module}/app-install.sh")
  key_name = "bastion-key"
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]  
  tags = {
    "Name" = "EC2 Demo 2"
  }
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/myterraformkey.pub")
}*/