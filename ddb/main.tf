resource "aws_dynamodb_table" "dynamodb-table" {
  name         = "VistorCounter"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "count"
  attribute {
    name = "count"
    type = "N"
  }

  tags = {
    Name = "VistorCounter"
  }
}