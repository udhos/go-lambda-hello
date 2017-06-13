#!/bin/sh

format() {
    local f="$1"
    gofmt -s -w "$f"
    go tool fix "$f"
    go tool vet .
    [ -x $GOPATH/bin/gosimple ] && $GOPATH/bin/gosimple "$f"
    [ -x $GOPATH/bin/golint ] && $GOPATH/bin/golint "$f"
    [ -x $GOPATH/bin/staticcheck ] && $GOPATH/bin/staticcheck "$f"
}

format handler.go

docker run --rm -e HANDLER=handler -e PACKAGE=handler -v ~/go:/go -v $PWD:/build -w /build eawsy/aws-lambda-go-shim:latest make all

echo "\npackage handler.zip built:\n"

unzip -l handler.zip
