locals {
  username             = "hanen"
  password             = "hanenhanen"
  db_name              = "mydatabase"
  port                 = "3306"

  engine               = "mysql"
  engine_version       = "8.0.25"
  family               = "mysql8.0"
  major_engine_version = "8.0"
  instance_class       = "db.m5.large"
  allocated_storage    = 5

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
}
resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = var.data_subnets
}

resource "aws_db_instance" "database" {
  allocated_storage = local.allocated_storage
  //db_subnet_group_name   = "default"
  engine         = local.engine
  engine_version = local.engine_version
  instance_class = local.instance_class
  multi_az       = false
  db_subnet_group_name        = "db_subnet"
  db_name        = local.db_name
  username       = local.username
  password       = local.password
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true

  skip_final_snapshot    = true
  vpc_security_group_ids = [var.data-sg]
}

/*module "database" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "MySQLDataBase"

  engine            = local.engine
  engine_version    = local.engine_version
  instance_class    = local.instance_class
  allocated_storage = local.allocated_storage

  db_name  = local.db_name
  username = local.user_name
  port     = local.port

  iam_database_authentication_enabled = true

  vpc_security_group_ids = var.data-sg

  maintenance_window = local.maintenance_window
  backup_window      = local.backup_window

  subnet_ids = var.data_subnets
  multi_az   = false

  # DB parameter group
  family = local.family

  # DB option group
  major_engine_version = local.major_engine_version

  # Database Deletion Protection
  deletion_protection = false

  backup_retention_period = 0
  skip_final_snapshot     = true


}*/




/*resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = aws_subnet.database[*].id

  tags = {
    Name = "subnet group"
  }
}*/