# Software Update SNS Notification System
![image](https://github.com/CHIHCHIEH-LAI/Software-Update-SNS-Notification-System/blob/main/imgs/diagram.jpg)

Using Terraform, AWS S3, Lambda, and SNS to manage and distribute software updates provides a scalable and efficient solution. Here’s how the system works:

1. `Upload`: When a new software package is uploaded to S3, it triggers a Lambda function.
2. `Notify`: The Lambda function sends a notification through SNS to all subscribed endpoints (email, Slack, etc.).
3. `Install`: Clients receive the notification, download the update, and install it.

Commands:

- `terraform init`
- `terraform plan -out=plan`
- `terraform apply "plan"`
- `terraform destroy`

Resources:

- [How to create an AWS S3 bucket using Terraform](https://kodekloud.com/blog/how-to-create-aws-s3-bucket-using-terraform/)
