resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "dukes-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "productId"

  attribute {
    name = "productId"
    type = "S"
  }
  tags = {
    Name        = "dukes-table"
    Environment = "production"
  }
}