variable "users" {
  description = "List of users to create"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the users"
  type        = map(string)
}

variable "buckets" {
  description = "List of buckets to create"
  type        = list(string)
}

variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
}
