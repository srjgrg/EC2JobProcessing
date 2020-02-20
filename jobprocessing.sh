#!/bin/bash

AWS_COMMAND=$(which aws)
if [ ! -f ${AWS_COMMAND} ]; then
  echo "ERROR: Missing aws commands, install awscli"
  exit 2
fi

if ! $(python -c "import boto.sqs" &> /dev/null); then
   echo "ERROR: boto libary for aws services not installed in python" >&2
   exit 2
fi


YOUR_AWS_REGION="us-east-1"

####################################################
# Create an S3 Bucket to host input and output files
# You can create a bucket from the [S3 web console](http://console.aws.amazon.com/s3/) or using the CLI:
S3_BUCKET_NAME="ec2jobprocessing01"      ##<S3 Bucket Name> ## Make all lower case letters  ## <Your AWS Region, e.g. "eu-west-1">
 aws s3 mb s3://${ec2jobprocessing01} \
   --region ${us-east-1}
  if [ $? -ne 0 ]; then
    echo "FAIL: create bucket"
  fi