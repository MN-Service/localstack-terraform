provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "mnservice"
  secret_key                  = "mnservice"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

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