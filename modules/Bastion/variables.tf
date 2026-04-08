variable "vpc_id" {}
variable "public_subnet_ids" { type = list(string)}
variable "ami_id" {}
variable "key_name" {}
variable "allowed_ip" { type = list(string)}
