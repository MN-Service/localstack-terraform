variable "endpoint_url" {
  type        = string
  description = "The URL of the endpoint"
  default     = "http://localhost:4566"
}

variable "s3_endpoint_url" {
  type        = string
  description = "The URL of the endpoint"
  default     = "http://s3.localhost.localstack.cloud:4566"
}

