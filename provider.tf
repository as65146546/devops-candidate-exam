provider "aws" {
  region  = "ap-south-1" # Don't change the region
}

# Add your S3 backend configuration here

terraform {
  backend "s3" {
    bucket         = "3.devops.candidate.exam"
    key            = "as65146546.tfstate"
    region         = "ap-south-1"

  }
}
