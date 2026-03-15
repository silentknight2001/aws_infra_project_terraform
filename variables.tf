variable "region" { type = string }
variable "vpc_cidr" { type = string }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "instance_type" { type = string }
variable "ami_id" {}
variable "db_username" {}
variable "db_password" { sensitive = true }
