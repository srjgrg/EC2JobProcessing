#!/bin/sh

yum update -y
easy_install --upgrade boto boto3

PARALLEL=1 # Number of parallel processes to run

SCRIPT=GetJobs.py
PARAMS=inputparams.txt

mkdir -p /var/workfiles/
aws s3 cp s3://ec2jobprocessing01/$SCRIPT /var/workfiles/
aws s3 cp s3://ec2jobprocessing01/$PARAMS /var/workfiles/

for i in $(seq $PARALLEL)
do
    LOGFILE=/var/workfiles/${SCRIPT}.$i.log
    echo "Starting $i of $PARALLEL - log file is $LOGFILE ..."
    nohup python /var/workfiles/$SCRIPT `cat /var/workfiles/$PARAMS` > $LOGFILE 2>&1 &
done
