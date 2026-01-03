variable "cloudflare_zone" {
  description = "Cloudflare zone used for delegation"
  type        = string
  nullable    = false
  sensitive   = false
}

variable "route53_zone" {
  description = "Cloudflare (sub)domain to delegate to Route53"
  type        = string
  nullable    = false
  sensitive   = false
}
