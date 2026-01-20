resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "ansible_ssm_transfer" {
  bucket = "${var.name_prefix}-ssm-transfer-${random_id.suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "ansible_ssm_transfer" {
  bucket = aws_s3_bucket.ansible_ssm_transfer.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "ansible_ssm_transfer" {
  bucket = aws_s3_bucket.ansible_ssm_transfer.id
  versioning_configuration {
    status = "Enabled"
  }
}
