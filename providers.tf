terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0, < 6.3.0, != 6.0.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
  required_version = "~>1.12.0"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = var.tags
  }
}


