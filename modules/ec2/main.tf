resource "aws_security_group" "ec2_security_group" {
  vpc_id = var.vpc_id
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [var.alb_sg_id]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_launch_template" "lt" {
  name_prefix = "tf_test_template"
  image_id = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  
  user_data = base64encode(<<EOF
  #!/bin/bash
  apt update 
  apt install httpd php -y
  systemctl start httpd
  systemctl enable httpd
  echo "Hello from ASG instance" > /var/www/html/index.html
  EOF
  )
}
