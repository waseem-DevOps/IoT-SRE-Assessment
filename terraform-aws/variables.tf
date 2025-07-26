variable "customer" {
    type = string
    default = "iti"
}
variable "env_name" {
    type = string
    default = "dev"
}

variable "cidr_block_vpc" {
    type = string
    default = "10.0.0.0/16"
}

variable "cidr_block_public_sub1" {
    type = string
    default = "10.0.1.0/24"
}

variable "cidr_block_public_sub2" {
    type = string
    default = "10.0.3.0/24"
}

variable "ec2_instance_type" {
    type = string
    default = "t2.micro"
}

#######################################################

variable "create_public1_subnets" {
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "create_subnets" {
    type = bool
    default = false
}
