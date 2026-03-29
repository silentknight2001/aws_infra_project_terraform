output "launch_template_id" {
  value = aws_launch_template.lt.id
}
# output "launch_template_id" {
#   value = aws_launch_template.this.id
# }
output "app_sg_id" {
  value = aws_security_group.app_sg.id
}