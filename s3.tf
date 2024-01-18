resource "aws_s3_bucket" "s3_bucket_1505" {
  bucket = "adi-terraform-s3-18012024"
  
  force_destroy = true
  
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3_bucket_1505.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.s3_bucket_1505.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#setting access control to objects in s3 bucket. 
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.s3_bucket_1505.id
  acl    = "public-read"
}