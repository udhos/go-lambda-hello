#!/bin/sh

aws iam create-role --role-name lambda_basic_execution \
--assume-role-policy-document '{
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  }'

exit

aws iam attach-role-policy --role-name lambda_basic_execution --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

role_arn=`aws iam get-role --role-name lambda_basic_execution --query 'Role.Arn' --output text`

aws lambda create-function --function-name hello --zip-file fileb://handler.zip --role $role_arn --runtime python2.7 --handler handler.Handle

