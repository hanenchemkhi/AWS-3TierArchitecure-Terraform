#VPC variables
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zone_names" {
  description = "Availability Zone Names"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_cidr" {
  description = "Public subnets cidr block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr" {
  description = "Private subnets cidr block"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.22.0/24"]
}

variable "data_cidr" {
  description = "Data subnets cidr block"
  type        = list(string)
  default     = ["10.0.111.0/24", "10.0.222.0/24"]
}
variable "my_public_ip" {
  description = "Public IP"
  type        = string
}
