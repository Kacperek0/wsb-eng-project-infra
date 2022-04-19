resource "aws_iam_user" "iam_user" {
  name = var.name
  path = "/"

  tags = var.tags
}

resource "aws_iam_policy_attachment" "policy_attachment" {
  name       = "policy_attachment"
  users      = [aws_iam_user.iam_user.name]
  policy_arn = var.policy_arn
}
