resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "tf_nat" {
    allocation_id = aws_eip.nat_eip.id 
    subnet_id = aws_subnet.public[0].id
    tags = {
        Name = "tf-nat"
    }
}