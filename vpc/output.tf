output "public_subnet_ids" {
  value = [aws_subnet.public1.id, aws_subnet.public2.id]
}

output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}