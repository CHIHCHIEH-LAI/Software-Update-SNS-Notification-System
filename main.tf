provider "aws" {
  region = "us-west-2"
}

# S3 Bucket
resource "aws_s3_bucket" "software_bucket" {
  bucket = "software-updates-bucket"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.software_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.notify_update.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

# SNS Topic
resource "aws_sns_topic" "software_updates" {
  name = "software-updates-topic"
}

# SNS Topic Subscriptions
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.software_updates.arn
  protocol  = "email"
  endpoint  = "your-email@example.com"
}

resource "aws_sns_topic_subscription" "slack_subscription" {
  topic_arn = aws_sns_topic.software_updates.arn
  protocol  = "https"
  endpoint  = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
}
