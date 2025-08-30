variable "domain_name" {
  type        = string
  description = "Hosted zone domain name"
}

variable "record_name" {
  type        = list(string)
  description = "List of record names"
  default     = []
}

variable "record_value" {
  type        = list(string)
  description = "List of record values"
  default     = []
}

variable "record_type" {
  type        = string
  description = "DNS record type"
  default     = "NS"
}

variable "ttl" {
  type        = number
  description = "Time to live for DNS record"
  default     = 300
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for resources"
  default     = {}
}
