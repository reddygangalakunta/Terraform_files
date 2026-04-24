terraform {
  backend "s3" {
    bucket = var.s3_bucket_name
    region = "us-east-1"
    key = "yashwanth/terraform.tfstate"
    dynamodb_table = var.dynamo_db_name
  }
}
