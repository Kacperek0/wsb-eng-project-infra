variable "cluster_identifier" {
  description = "The name of the RDS cluster"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "tags" {
  description = "The tags for the Lambda function"
  type        = map(string)
}
