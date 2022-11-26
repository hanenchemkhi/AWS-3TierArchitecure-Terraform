variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
  default     = "~/.ssh/terraformkey.pub"
}

variable "bastion-sg" {
  type = string
}

variable "webserver-sg" {
  type = string
}

variable "public_subnet" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string

}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "lb_tg" {}
