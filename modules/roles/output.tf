output "user_policy_arn" {
  value       = aws_iam_policy.read_only_policy.arn
  description = "The ARN of the IAM policy"
}

output "lambda_policy_arn" {
  value       = aws_iam_role.iam_for_lambda.arn
  description = "The ARN of the IAM policy"
}

output "lambda_logging_arn" {
  value       = aws_iam_policy.lambda_logging.arn
  description = "The ARN of the IAM policy"
}
