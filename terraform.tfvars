region = "ap-south-1"
vpc_cidr = "10.0.0.0/16"

public_subnets = [ "10.0.1.0/24", "10.0.2.0/24" ]
private_subnets = [ "10.0.3.0/24", "10.0.4.0/24" ]

instance_type = "t3.micro"
ami_id = "ami-019715e0d74f695be"

db_username = "admin"
db_password = "my_db_pass"