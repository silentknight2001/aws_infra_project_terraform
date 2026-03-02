variable "region" {}
variable "vpc_cidr" {}
variable "public_subnets" {type = list(stirng)}
variable "private_subnets" {type = list(stirng)}
variable "instance_type" {}
variable "ami_id" {}
variable "db_username" {}
variable "db_password" { sensitive = true }
