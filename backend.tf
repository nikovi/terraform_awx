resource "aws_s3_bucket" "terraform_state" {
  bucket = 
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = 
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = 
    key            = "terraform.tfstate"
    dynamodb_table = 
    region         = "us-east-1"
    profile        = 
  }
}
