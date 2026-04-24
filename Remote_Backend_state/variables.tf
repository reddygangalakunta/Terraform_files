variable "s3_bucket_name" {
  description = "This is the S3 bucket used for remote statefile"
  type = string
}

variable "dynamo_db_name" {
  description = "This is the dynamo_db name for remote statefile locking"
  type = string
}