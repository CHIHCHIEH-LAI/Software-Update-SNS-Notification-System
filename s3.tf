resource "aws_s3_bucket" "software_bucket" {
  bucket = "software-updates-bucket"
  tags = {
    Name = "Software Updates Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.software_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.notify_update.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix = ".zip"
  }
}