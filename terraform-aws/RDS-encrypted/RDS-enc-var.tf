variable "db_identifier" {}
variable "instance_type" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "private_subnets" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
