# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}


/*variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}*/

/*variable "ec2_instance" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.micro"

}


#Create database variables
variable "rds_instance" {
  type = map(any)
  default = {
    allocated_storage   = 10
    engine              = "mysql"
    engine_version      = "8.0.20"
    instance_class      = "db.t2.micro"
    multi_az            = false
    name                = "mydb"
    skip_final_snapshot = true
  }
}

#Create database sensitive variables
variable "user_information" {
  type = map(any)
  default = {
    username = "username"
    password = "password"
  }
  sensitive = true
}

*/