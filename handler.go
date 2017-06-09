package main

import (
	"fmt"
	"log"

	"github.com/eawsy/aws-lambda-go-core/service/lambda/runtime"
)

var counter int // Lambda may (or may not) keep this across invokations

// evt receives the function JSON payload parsed into a map structure

func Handle(evt interface{}, ctx *runtime.Context) (string, error) {

	counter++

	msg := fmt.Sprintf("Hello, World!\n") +
		fmt.Sprintf("Counter=%d\n", counter) +
		fmt.Sprintf("Event: %v\n", evt) +
		fmt.Sprintf("Log stream name: %s\n", ctx.LogStreamName) +
		fmt.Sprintf("Log group name: %s\n", ctx.LogGroupName) +
		fmt.Sprintf("Request ID: %s\n", ctx.AWSRequestID) +
		fmt.Sprintf("Mem. limits(MB): %d\n", ctx.MemoryLimitInMB) +
		fmt.Sprintf("ClientContext: %v\n", ctx.ClientContext)

	log.Print(msg)

	return msg, nil
}
