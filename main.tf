variable "endpoint_url" {
  type        = string
  description = "The URL of the endpoint"
  default     = "http://localhost:4566"
}

provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "mnservice"
  secret_key                  = "mnservice"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true


  endpoints {
    apigateway     = var.endpoint_url
    apigatewayv2   = var.endpoint_url
    cloudformation = var.endpoint_url
    cloudwatch     = var.endpoint_url
    dynamodb       = var.endpoint_url
    ec2            = var.endpoint_url
    es             = var.endpoint_url
    elasticache    = var.endpoint_url
    firehose       = var.endpoint_url
    iam            = var.endpoint_url
    kinesis        = var.endpoint_url
    lambda         = var.endpoint_url
    rds            = var.endpoint_url
    redshift       = var.endpoint_url
    route53        = var.endpoint_url
    s3             = var.endpoint_url
    secretsmanager = var.endpoint_url
    ses            = var.endpoint_url
    sns            = var.endpoint_url
    sqs            = var.endpoint_url
    ssm            = var.endpoint_url
    stepfunctions  = var.endpoint_url
    sts            = var.endpoint_url
  }
}

######### DynamoDB #########

resource "aws_dynamodb_table" "mn-service-dev-consumer-events" {
  name           = "mn-service-dev-consumer-events"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "Id" 

  attribute {
    name = "Id" 
    type = "S"
  }
}

# ######### SNS Topic #########

resource "aws_sns_topic" "sns_topic" {
  name      =   "mn-service-producer-events"
}

# ######### SQS Queue #########

resource "aws_sqs_queue" "queue" {
  name      =   "mn-service-consumer-events"
}

# ######### SNS Subscription #########

resource "aws_sns_topic_subscription" "private_http_subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn   
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.queue.arn 
  endpoint_auto_confirms = true
}

resource "aws_s3_bucket" "mnservice-bucket" {
  bucket = "s3-1"

  tags = {
    Name        = "mnservice-bucket"
    Environment = "Dev"
  }
}
