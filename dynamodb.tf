resource "aws_dynamodb_table" "session_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "SessionId"

  attribute {
    name = "SessionId"
    type = "S"
  }

  tags = {
    Name = "SessionTable"
  }
}