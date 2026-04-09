resource "aws_security_group" "app_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "app-security-group"
  }
}


resource "aws_launch_template" "lt" {
  name_prefix   = "tf_test_template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.app_sg.id]
    lifecycle {
    create_before_destroy = true
  }
  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install apache2 php php-pgsql -y

systemctl start apache2
systemctl enable apache2

rm -f /var/www/html/index.html

cat <<EOT > /var/www/html/index.php
<?php
\$conn = pg_connect("host=${var.db_endpoint} port=5432 dbname=tf_test_postgres user=${var.db_username} password=${var.db_password}");

if (!\$conn) {
    die("Connection failed test_2nd");
}

echo "Postgress DB Connected successfully";
?>
EOT

EOF
  )
}