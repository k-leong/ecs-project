resource "aws_vpc" "terraform_test" {
  cidr_block = "172.30.0.0/16"

  tags = {
    Name = "terraform test"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.terraform_test.id
  cidr_block        = "172.30.0.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.terraform_test.id
  cidr_block        = "172.30.30.0/24"
  availability_zone = "us-west-1c"

  tags = {
    Name = "public subnet 2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.terraform_test.id
  cidr_block        = "172.30.60.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.terraform_test.id
  cidr_block        = "172.30.90.0/24"
  availability_zone = "us-west-1c"

  tags = {
    Name = "private subnet 2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_test.id

  tags = {
    Name = "test internet gateway"
  }
}

resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.terraform_test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "test route table"
  }
}

resource "aws_route_table_association" "public1_association" {
  route_table_id = aws_route_table.test_rt.id
  subnet_id      = aws_subnet.public1.id
}

resource "aws_route_table_association" "public2_association" {
  route_table_id = aws_route_table.test_rt.id
  subnet_id      = aws_subnet.public2.id
}
