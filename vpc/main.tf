resource "aws_vpc" "tf_vpc" {
  cidr_block = "172.50.0.0/16"

  tags = {
    Name = "terraform vpc"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "172.50.0.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name = "terraform public subnet 1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "172.50.30.0/24"
  availability_zone = "us-west-1c"

  tags = {
    Name = "terraform public subnet 2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "terraform internet gateway"
  }
}
