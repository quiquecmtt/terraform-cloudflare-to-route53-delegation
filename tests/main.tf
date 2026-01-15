terraform {
  required_version = ">= 1.10.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "cloudflare" {
  api_token = "test-token-OSnWeIC97OE2fyOHzvwkO4BXBlqPXboXUA1h93I"
}

provider "aws" {
  region = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

module "delegation" {
  source = "../"

  cloudflare_zone = "example.com"
  route53_zone    = "sub.example.com"
}
