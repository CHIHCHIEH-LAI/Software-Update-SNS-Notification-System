import json
import boto3
import os

sns_client = boto3.client('sns')

def lambda_handler(event, context):
    sns_topic_arn = os.environ['SNS_TOPIC_ARN']
    message = {
        'event': 'new_software_update',
        'bucket': event['Records'][0]['s3']['bucket']['name'],
        'object': event['Records'][0]['s3']['object']['key']
    }
    
    response = sns_client.publish(
        TopicArn=sns_topic_arn,
        Message=json.dumps({'default': json.dumps(message)}),
        MessageStructure='json'
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Notification sent successfully')
    }
