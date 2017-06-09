# go-lambda-hello
golang aws lambda hello world

Using https://github.com/eawsy/aws-lambda-go-shim

Quick Start
===========

1) Install docker

2) Add AWS permissions to create IAM roles

3) Build, install, run

First deploy:

    0-build.sh
    1-deploy.sh
    2-run.sh

4) Change cycle

Update deploy:

    # Edit handler.go

    0-build.sh  ;# rebuild
    3-update.sh ;# upload
    2-run.sh    ;# test

