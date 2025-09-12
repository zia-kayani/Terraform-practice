resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-portfolio-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action   = ["s3:GetObject"]
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}


resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.my_bucket.bucket
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.my_bucket.bucket
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}


resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
depends_on = [ aws_s3_bucket_policy.public_read ]
}