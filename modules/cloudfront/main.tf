resource "aws_cloudfront_origin_access_identity" "default" {
  comment = var.oai_comment
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled = true
  comment = var.distribution_comment

  origin_group {
    origin_id = "S3OriginGroup"

    failover_criteria {
      status_codes = var.failover_status_codes
    }

    member {
      origin_id = "PrimaryS3"
    }

    member {
      origin_id = "FailoverS3"
    }
  }

  origin {
    domain_name = "${var.bucket_name}.s3.${var.aws_region}.amazonaws.com"
    origin_id   = "PrimaryS3"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path
    }
  }

  origin {
    domain_name = "${var.bucket_name}.s3.${var.aws_region}.amazonaws.com"
    origin_id   = "FailoverS3"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id       = "S3OriginGroup"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    compress         = true

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
