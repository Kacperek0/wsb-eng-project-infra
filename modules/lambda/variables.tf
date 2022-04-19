variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "value of the role_arn output"
  type        = string
}

variable "s3_bucket" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "s3_key_lambda" {
  description = "The key of the Lambda function zip file"
  type        = string
}

variable "s3_key_layer" {
  description = "The key of the Lambda layer zip file"
  type        = string
}

variable "environment" {
  description = "The environment variables for the Lambda function"
  type        = map(string)
}

variable "tags" {
  description = "The tags for the Lambda function"
  type        = map(string)
}
