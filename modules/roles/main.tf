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
