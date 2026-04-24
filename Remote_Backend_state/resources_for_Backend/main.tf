provider "aws" {
    region = "us-east-1"
}

# resource "aws_instance" "webserver" {
#   ami                    = "ami-0ec10929233384c7f"
#    instance_type          = "t3.micro"
# }
resource "aws_s3_bucket" "backend_bucket" {
    bucket = "yashwanth2026-s3-backend"
    region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform_locks" {
    name         = "terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}