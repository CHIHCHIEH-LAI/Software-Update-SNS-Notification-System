output "s3_bucket_name" {
  value = aws_s3_bucket.software_bucket.bucket
}

output "sns_topic_arn" {
  value = aws_sns_topic.software_updates.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.notify_update.function_name
}
