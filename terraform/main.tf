terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Intentionally weak: public access not blocked, no encryption/versioning
resource "aws_s3_bucket" "demo" {
  bucket = "psci-demo-bucket-change-me-12345"
  tags = { Project = "psci-demo" }
}

# ❌ Deliberately disable public access protections (KICS should flag this as HIGH)
resource "aws_s3_bucket_public_access_block" "disabled_example" {
  bucket                      = aws_s3_bucket.demo.id
  block_public_acls           = false
  block_public_policy         = false
  ignore_public_acls          = false
  restrict_public_buckets     = false
}
