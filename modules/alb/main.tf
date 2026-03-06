resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_alb" "this" {
    name = "tf_test_alb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.public_subnets  
}
resource "aws_lb_target_group" "tg" {
    name = "tf_test_tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}
resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_alb.this.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.tg.arn
    }
  
}
