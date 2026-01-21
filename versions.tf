terraform {
  required_version = ">= 1.10.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.16.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
}

