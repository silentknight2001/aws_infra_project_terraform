terraform {
  backend "s3" {
    bucket = "silentknight-terraform-state-bucket"
    key = "project/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
}