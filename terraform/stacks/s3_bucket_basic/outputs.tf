output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.main.arn
}

output "bucket_domain_name" {
  description = "The bucket region-specific domain name"
  value       = aws_s3_bucket.main.bucket_regional_domain_name
}

output "bucket_endpoint" {
  description = "The S3 bucket endpoint URL"
  value       = "s3://${aws_s3_bucket.main.id}"
}

output "versioning_enabled" {
  description = "Whether versioning is enabled on the bucket"
  value       = var.enable_versioning
}

output "intelligent_tiering_enabled" {
  description = "Whether Intelligent-Tiering is enabled for cost optimization"
  value       = var.enable_intelligent_tiering
}

output "public_access_blocked" {
  description = "Whether all public access is blocked"
  value       = var.block_public_access
}

