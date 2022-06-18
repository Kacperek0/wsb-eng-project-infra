resource "aws_iam_policy" "read_only_policy" {
  name        = "read-only-policy"
  path        = "/"
  description = "Global Read Only policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "iam:Get*",
        "iam:List*",
        "iam:Generate*"
      ]
      Resource = [
        "*"
      ]
    }]
  })
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam-for-lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda-logging"
  path        = "/"
  description = "Lambda Logging policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:PutObject",
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetBucketPolicy",
        "s3:GetBucketTagging",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning"
      ]
      Resource = [
        "arn:aws:logs:*:*:*",
        "arn:aws:s3:::*"
      ]
    }]
  })
}

