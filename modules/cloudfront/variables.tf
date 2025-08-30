variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
}

variable "aws_region" {
  description = "Região da AWS onde o bucket está localizado"
  type        = string
  default     = "us-east-1"
}

variable "oai_comment" {
  description = "Comentário para o OAI"
  type        = string
  default     = "OAI for CloudFront access to S3 bucket"
}

variable "distribution_comment" {
  description = "Comentário para a distribuição CloudFront"
  type        = string
  default     = "CloudFront distribution for S3 bucket with failover"
}

variable "failover_status_codes" {
  description = "Códigos HTTP que disparam failover"
  type        = list(number)
  default     = [403, 404, 500, 502]
}
