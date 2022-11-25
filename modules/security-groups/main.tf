
resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow SSH Inbound Traffic From my IP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_public_ip]
  }

}


resource "aws_security_group" "alb_sg" {
  name        = "lb_sg"
  description = "Allow Inbound HTTP Traffic via ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow SSH inbound traffic from Bastion, and HTTP inbound traffic from loadbalancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

}

resource "aws_security_group" "webserver_sg" {
  name        = "webserer_sg"
  description = "Allow Inbound HTTP from FRONTEND APP, and SSH inbound traffic from Bastion"
  vpc_id      = var.vpc_id


  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }


}

resource "aws_security_group" "data_sg" {
  name        = "data_sg"
  description = "Allow MySQL Port Inbound Traffic from Backend App Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.webserver_sg.id]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }
}


### DATABASE SUBNET GROUP

/*resource "aws_db_subnet_group" "rds_subnetgroup" {

  name       = "rds_subnetgroup"
  subnet_ids = [aws_subnet.three_tier_private_subnets_db[0].id, aws_subnet.three_tier_private_subnets_db[1].id]

  tags = {
    Name = "three_tier_rds_sng"
  }
}*/
