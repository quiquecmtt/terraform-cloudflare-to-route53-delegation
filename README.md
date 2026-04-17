# Cloudflare to Route53 Delegation

Terraform module to delegate a subdomain from Cloudflare to AWS Route53.

## Overview

This module creates the necessary DNS records to delegate a subdomain managed in Cloudflare to an AWS Route53 hosted zone. It:

1. Creates a new Route53 hosted zone for the subdomain
2. Retrieves the NS records from Route53
3. Creates NS records in Cloudflare pointing to the Route53 nameservers

## Usage

```hcl
module "delegation" {
  source = "github.com/quiquecmtt/terraform-cloudflare-to-route53-delegation"

  cloudflare_zone = "example.com"
  route53_zone    = "aws.example.com"
}
```

## Prerequisites

- Cloudflare API token with Zone:Read and DNS:Edit permissions
- AWS credentials with Route53 permissions

## Provider Configuration

```hcl
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "aws" {
  region = "us-east-1"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.40.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.40.0 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.delegated_zone](https://registry.terraform.io/providers/hashicorp/aws/6.40.0/docs/resources/route53_zone) | resource |
| [cloudflare_dns_record.delegation_records](https://registry.terraform.io/providers/cloudflare/cloudflare/5.18.0/docs/resources/dns_record) | resource |
| [cloudflare_zone.zone_info](https://registry.terraform.io/providers/cloudflare/cloudflare/5.18.0/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_zone"></a> [cloudflare\_zone](#input\_cloudflare\_zone) | Cloudflare zone used for delegation | `string` | n/a | yes |
| <a name="input_route53_zone"></a> [route53\_zone](#input\_route53\_zone) | Cloudflare (sub)domain to delegate to Route53 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_hosted_zone_id"></a> [route53\_hosted\_zone\_id](#output\_route53\_hosted\_zone\_id) | The ID of the newly created AWS Route53 Hosted Zone. |
| <a name="output_route53_nameservers"></a> [route53\_nameservers](#output\_route53\_nameservers) | The list of AWS nameservers that were used for delegation in Cloudflare. |
<!-- END_TF_DOCS -->
