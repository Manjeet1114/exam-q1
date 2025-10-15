# Create KMS Key for S3 encryption
resource "aws_kms_key" "s3_kms" {
  description             = "KMS Key for S3 encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = {
    Name = "S3-KMS"
  }
}

# Generate a random suffix for the S3 bucket name
resource "random_id" "bucket_id" {
  byte_length = 4
}

# Create S3 Bucket with KMS encryption
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "${var.s3_bucket_name_prefix}-${random_id.bucket_id.hex}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_kms.id  # Reference the KMS key declared above
      }
    }
  }

  tags = {
    Name = "LogsBucket"
  }
}

# Set private ACL using dedicated resource
resource "aws_s3_bucket_acl" "logs_bucket_acl" {
  bucket = aws_s3_bucket.logs_bucket.id
  acl    = "private"
}
