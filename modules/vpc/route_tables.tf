resource "aws_route_table" "tf_rt_public" {
  vpc_id = aws_vpc.this.id
}
resource "aws_route" "public_internet" {
    route_table_id = aws_route_table.pubic.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id 
}

resource "aws_route_table_association" "public_rt_associ" {
  count = length(aws_subnet.public)

  subnet_id = aws_subnet.public[count.index].id 
  route_table_id = aws_route_table.tf_rt_public.id   
}

resource "aws_route_table" "tf_rt_private" {
  vpc_id = aws_vpc.this.id 
}

resource "aws_route" "privet_nat_route" {
  route_table_id = aws_route_table.private.id 
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.tf_nat.id 
}

resource "aws_route_table_association" "privet_nat_route_associa" {
  count = length(aws_subnet.private)

  subnet_id = aws_subnet.private[count.index].id 
  route_table_id = aws_route_table.tf_rt_private
}
