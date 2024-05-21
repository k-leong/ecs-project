resource "aws_vpc" "tf_vpc" {
  cidr_block = "172.50.0.0/16"

  tags = {
    Name = "terraform vpc"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id = aws_vpc.tf_vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "terraform public subnet ${each.key}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "terraform internet gateway"
  }
}
