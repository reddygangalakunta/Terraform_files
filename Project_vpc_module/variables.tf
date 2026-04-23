variable "cidr" {
  default = "10.0.0.0/16"
}
variable "s3_bucket_name" {
    description = "S3 Bucket name"
    type = string
}