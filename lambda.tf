provider "aws" {
  region                  = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "smashem"
}

resource "aws_s3_bucket" "smashem-cypress-lambda-demo" {
  bucket = "smashem-cypress-lambda-demo"
  acl    = "private"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "lambda/"
  output_path = "lambda.zip"
}

resource "aws_s3_bucket_object" "lambda" {
  bucket = "smashem-cypress-lambda-demo"

  key    = "lambda.zip"
  source = "lambda.zip"
  etag   = "md5(file('lambda.zip'))"

}

resource "aws_lambda_function" "cypress_runner" {
  function_name = "cypress_runner"
  s3_bucket     = "smashem-cypress-lambda-demo"
  s3_key        = "lambda.zip"
  role          = "${aws_iam_role.lambda.arn}"
  handler       = "index.handler"
  runtime       = "nodejs10.x"
  memory_size   = 3008
  timeout       = 300
}

resource "aws_iam_role" "lambda" {
  name = "lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda" {
  name = "lambda_init"
  role = "${aws_iam_role.lambda.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
		{
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "local_file" "lambda_arn" {
  content  = "aws_lambda_function.cypress_runner.arn"
  filename = "deployed_lambda_arn"
}
