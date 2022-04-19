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
        "logs:PutLogEvents"
      ]
      Resource = [
        "arn:aws:logs:*:*:*"
      ]
    }]
  })
}

