variable "vpc_id" {
  type = string
}

variable "data_subnets" {
  type = list(string)
}

variable "data-sg" {
  type = string
}