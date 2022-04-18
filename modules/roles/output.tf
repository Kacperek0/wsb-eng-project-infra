output "policy_arn" {
  value       = aws_iam_policy.read_only_policy.arn
  description = "The ARN of the IAM policy"
}
