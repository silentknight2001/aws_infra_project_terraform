resource "aws_db_subnet_group" "tf_db_subnet" {
    name = "tf_test_db_subnet_group"
    subnet_ids = var.private_subnet_ids

    tags = {
      Name = "tf-test-db-subnet-group"
    }
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  description = "Allow MySQL access from application server"
  vpc_id = var.vpc_id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    security_groups = [var.app_sg_id]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "db-security-groups"
  }
}

resource "aws_db_instance" "primary" {
    identifier = "primary-db"

    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"

    db_name = "tf_test_mysql"
    username = var.db_username
    password = var.db_password

    multi_az = true
    publicly_accessible = false

    db_subnet_group_name = aws_db_subnet_group.tf_db_subnet.name
    vpc_security_group_ids = [aws_security_group.rds_sg.id]

    backup_retention_period = 7
    skip_final_snapshot = true

    tags = {
      Name = "primary-rds-db"
    }
}

resource "aws_db_instance" "replica" {
  provider = aws.virginia

  replicate_source_db = aws_db_instance.primary.arn
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true
}