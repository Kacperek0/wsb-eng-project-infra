terraform {
    required_version = ">= 1.1.8"
}

provider "aws" {
  region = "eu-west-1"
  profile = "kacper"
}
