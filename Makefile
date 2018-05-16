pkgs = $(shell go list ./... | grep -v /vendor/)

all: format test install

install:
	go install github.com/operator-framework/operator-sdk/commands/operator-sdk

test:
	./hack/test

format:
	go fmt $(pkgs)

dep:
	dep ensure

.PHONY: all install test format dep
