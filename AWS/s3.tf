resource "aws_s3_bucket" "example_bucket" {
  bucket = "rf-bucket222555777"
}


resource "aws_s3_bucket_public_access_block" "example_bucket_public" {
  bucket = aws_s3_bucket.example_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "internal_data_policy" {
  bucket = aws_s3_bucket.example_bucket.id
  policy = data.aws_iam_policy_document.public_access_policy.json
}

data "aws_iam_policy_document" "public_access_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.example_bucket.arn,
      "${aws_s3_bucket.example_bucket.arn}/*",
    ]
  }
}
