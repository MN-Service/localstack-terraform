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
    Name        = "s3-1"
    Environment = "Dev"
  }
}
