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