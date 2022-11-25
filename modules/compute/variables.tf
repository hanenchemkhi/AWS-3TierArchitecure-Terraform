variable "ssh_public_key"{
    description = "SSH public key"
    type = string
    default = "~/.ssh/terraformkey.pub"
}

variable "bastion-sg"{
    type = string
}

variable "subnet"{
    type = string
}

variable "vpc_id"{
    type = string

}
variable "instance_type"{
    type = string
    default = "t2.micro"
}