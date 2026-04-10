variable "ami_id" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "alb_sg_id" {}
variable "db_endpoint" {
  description = "RDS endpoint"
  type        = string
}
variable "db_username" {}
variable "db_password" {}
variable "bastion_sg_id" {}