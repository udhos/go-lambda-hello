#!/bin/sh

aws lambda invoke --function-name hello --invocation-type RequestResponse --log-type Tail /dev/stderr --query LogResult --output text | base64 -d
