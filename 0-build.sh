#!/bin/sh

if ! hash docker; then
	docker not found - please install it first
	exit 1
fi

docker pull eawsy/aws-lambda-go-shim:latest
go get -u -d github.com/eawsy/aws-lambda-go-core/...

# use Makefile from https://github.com/eawsy/aws-lambda-go-shim
#wget -O Makefile https://git.io/vytH8
#make

docker run --rm -e HANDLER=handler -e PACKAGE=handler -v ~/go:/go -v $PWD:/build -w /build eawsy/aws-lambda-go-shim:latest make all
