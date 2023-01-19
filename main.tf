terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  cloud {
    organization = "stagging-env"

    workspaces {
      name = "gh-action"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_s3_bucket" "test-bucket" {
  bucket_prefix = "itf-"
  acl           = "public-read"
  versioning {
    enabled = true
  }
}
