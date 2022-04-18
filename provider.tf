terraform {
    required_version = ">= 1.1.8"

    backend "s3" {
        bucket = "eng-project-infra"
        key    = "terraform.tfstate"
        region = "eu-west-1"
        dynamodb_table = "eng-project-infra-dynamo"
        profile = "kacper"
    }
}

provider "aws" {
  region = "eu-west-1"
  profile = "kacper"
}

