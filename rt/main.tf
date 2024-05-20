resource "aws_route_table" "igw_route" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = "test route table"
  }
}

resource "aws_route_table_association" "public1_association" {
  route_table_id = aws_route_table.igw_route.id
  subnet_id      = var.subnet[0]
}

resource "aws_route_table_association" "public2_association" {
  route_table_id = aws_route_table.igw_route.id
  subnet_id      = var.subnet[1]
}