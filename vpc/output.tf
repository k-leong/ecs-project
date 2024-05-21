output "public_subnet_ids" {
  value = { for name, subnet in aws_subnet.public : name => subnet.id }
}

output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}