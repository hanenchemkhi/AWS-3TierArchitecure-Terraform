variable "vpc_id" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}
variable "security_groups" {
  type = string
}
variable "webservers" {}