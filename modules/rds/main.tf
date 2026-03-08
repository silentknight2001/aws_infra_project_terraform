resource "aws_db_subnet_group" "db_subnet" {
    name = "tf_test_db_subnet"
    subnet_ids = var.private_subnets
}

resource "aws_db_instance" "mysql" {
    allocated_storage = 20
    engine = "mysql"
    instance_class = "db.t3.micro"
    db_name = "tf_test_mysql"
    username = var.db_username
    password = var.db_password
    multi_az = true
    db_subnet_group_name = aws_db_subnet_group.db_subnet.name
    skip_final_snapshot = true
}