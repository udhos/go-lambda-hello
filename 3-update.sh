#!/bin/sh

aws lambda update-function-code --function-name hello --zip-file fileb://handler.zip

