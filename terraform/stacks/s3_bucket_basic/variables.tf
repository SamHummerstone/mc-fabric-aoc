variable "bucket_name" {
  description = "Name of the S3 bucket. Must be globally unique."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must contain only lowercase letters, numbers, hyphens, and dots, and must start and end with a letter or number."
  }
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "enable_versioning" {
  description = "Enable S3 object versioning"
  type        = bool
  default     = false
}

variable "enable_intelligent_tiering" {
  description = "Enable S3 Intelligent-Tiering for automatic cost optimization"
  type        = bool
  default     = true
}

variable "intelligent_tiering_days" {
  description = "Number of days before moving objects to lower cost tiers in Intelligent-Tiering"
  type        = number
  default     = 30
}

variable "aws_region" {
  description = "AWS region for the S3 bucket"
  type        = string
  default     = "us-east-1"
}

variable "additional_tags" {
  description = "Additional tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "block_public_access" {
  description = "Whether to block all public access to the bucket"
  type        = bool
  default     = true
}

variable "enable_server_side_encryption" {
  description = "Enable default server-side encryption (S3-managed SSE)"
  type        = bool
  default     = true
}
