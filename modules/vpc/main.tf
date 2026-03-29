resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
   tags = {
    Name = "tf-project-vpc"
  }
}

resource "aws_internet_gateway" "tf_igw" {
    vpc_id = aws_vpc.this.id
    tags = {
      Name = "tf-igw"
    }
}
