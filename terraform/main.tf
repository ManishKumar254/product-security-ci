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

# Example S3 bucket for static scanning (do NOT apply in this demo).
resource "aws_s3_bucket" "demo" {
  bucket = "psci-demo-bucket-change-me-12345"
  tags = {
    Project = "psci-demo"
  }
}

# ---- OPTIONAL: deliberately introduce a misconfig for practice ----
# To make KICS flag a HIGH finding, you could uncomment ONE of the
# following blocks – but ensure braces are balanced.

# (A) Missing block public access / encryption (older style examples):
# resource "aws_s3_bucket_public_access_block" "disabled_example" {
#   bucket = aws_s3_bucket.demo.id
#   block_public_acls   = false
#   block_public_policy = false
#   ignore_public_acls  = false
#   restrict_public_buckets = false
# }

# (B) Ownership controls set in a risky way (depends on combo of settings):
# resource "aws_s3_bucket_ownership_controls" "bad_example" {
#   bucket = aws_s3_bucket.demo.id
#   rule {
#     object_ownership = "ObjectWriter"
#   }
# }
