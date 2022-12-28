resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = var.tags

  aws_s3_bucket_versioning "versioning" {
    bucket  = aws_s3_bucket.bucket.id
    enabled = true
  }
}

