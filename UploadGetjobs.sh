#!/bin/sh

aws s3 cp GetJobs.py s3://ec2jobprocessing01/ --region us-east-1

aws s3 cp inputparams.txt s3://ec2jobprocessing01/ --region us-east-1