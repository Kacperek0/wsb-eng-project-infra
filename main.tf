terraform {
    required_version = ">= 1.1.8"

    required_providers {
        aws = ">= 1.11.0"
    }
}

provider "aws" {
    region = "eu-west-1"
}
