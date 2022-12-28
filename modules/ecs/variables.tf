variable "log_group_name" {
  description = "Name of the log group"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "tags" {
  description = "The tags for the Lambda function"
  type        = map(string)
}
