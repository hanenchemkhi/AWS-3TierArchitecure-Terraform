variable "vpc_id" {
  type = string

}

variable "my_public_ip" {
  description = "Public IP"
  type        = string
}

variable "public_subnets" {
  type = list(string)

}
variable "private_subnets" {
  type = list(string)

}

variable "data_subnets" {
  type = list(string)

}



variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}
variable "availability_zone_names" {
  description = "Availability Zone Names"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}