output "cloudfront_distribution_id" {
  description = "ID da distribuição CloudFront"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_distribution_domain_name" {
  description = "Domain name da distribuição CloudFront"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}