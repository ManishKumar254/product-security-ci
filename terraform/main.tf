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

# Example resource purely for static scanning.
# DO NOT run "terraform apply" in this demo.
resource "aws_s3_bucket" "demo" {
  bucket = "psci-demo-bucket-change-me-12345"
}

# To generate a finding for practice, uncomment a "bad" setting below, commit, and re-run CI:
# resource "aws_s3_bucket_ownership_controls" "bad_example" {
#   bucket = aws_s3_bucket.demo.id
#   rule { object_ownership = "ObjectWriter" } # may trigger rules depending on combos
# }
