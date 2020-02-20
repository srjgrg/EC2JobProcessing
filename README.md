* step 1

# create policy and update it into jobprocessing.sh

* step 2

# update the required name create the bucket , autoscaling policy ,queue
```shell
sh jobprocessing.sh
```
* step 3

# upload inputparams.txt and GetJobs.py into s3bucket 

```shell
sh UploadGetjobs.sh
```
* step 4

# install awscli , boto , boto3 into your local 
```shell
pip install awscli boto boto3
```
* step 5

# upload job and code into s3 bucket

```shell
python SendJobs.py job/ ec2jobprocessing01 input/ output/ batch-queue us-east-1
```
