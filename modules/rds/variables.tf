variable "vpc_id" {}
variable "private_subnet_ids" { type = list(string) }
variable "app_sg_id" {}
variable "db_username" {}
variable "db_password" {}
variable "bastion_sg_id" {}