# go-lambda-hello
golang aws lambda hello world

Using https://github.com/eawsy/aws-lambda-go-shim

Quick Start
===========

1) Install docker

2) Add AWS permissions to create IAM roles

3) Build, install, run

First deploy:

    0-fetch.sh
    1-build.sh
    2-deploy.sh
    3-run.sh

4) Change cycle

Update deploy:

    # Edit handler.go

    1-build.sh  ;# rebuild
    4-update.sh ;# upload
    3-run.sh    ;# test

