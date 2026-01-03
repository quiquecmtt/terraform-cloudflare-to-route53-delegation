resource "aws_route53_zone" "delegated_zone" {
  name    = var.route53_zone
  comment = "Delegated zone from Cloudflare. Managed by OpenTofu"
  tags = {
    managedBy  = "OpenTofu"
    tofuModule = "cloudflare-to-route53-delegation"
  }
}
