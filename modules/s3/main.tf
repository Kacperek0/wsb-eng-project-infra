resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = var.tags

  versioning {
    enabled = true
  }
}

