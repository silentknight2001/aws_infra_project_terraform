resource "aws_security_group" "bastion_sg" {

    name = "bastion-sg"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "bastion" {
    ami = var.ami_id
    instance_type = "t3.micro"
    subnet_id = var.public_subnet_ids[0]
    vpc_security_group_ids = [aws_security_group.bastion_sg.id]
    associate_public_ip_address = true
    key_name = var.key_name

    tags = {
      Name = "bastion-host"
    }
}