output "db_endpoint" {
  # value = aws_db_instance.primary.endpoint
  value = aws_db_instance.primary.address
}