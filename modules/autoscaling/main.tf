resource "aws_autoscaling_group" "asg" {
    desired_capacity = 2
    max_size = 3
    min_size = 2
    vpc_zone_identifier = var.public_subnets

    launch_template {
      id = var.launch_template.id 
      version = "$Latest"
    }

    target_group_arns = [var.target_group_arn]
  
}