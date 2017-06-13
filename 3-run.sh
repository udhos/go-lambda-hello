#!/bin/sh

payload="{
	\"user\": \"john\",
	\"id\": 2001
}"

aws lambda invoke --function-name hello --invocation-type RequestResponse --payload="$payload" --log-type Tail /dev/stderr --query LogResult --output text | base64 -d
