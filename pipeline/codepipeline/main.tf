resource "aws_vpc" "tf_vpc" {
  cidr_block = "172.50.0.0/16"

  tags = {
    Name = "terraform vpc"
  }
}