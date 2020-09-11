SHELL := /bin/bash

REV := $(shell git rev-parse HEAD)
CHANGES := $(shell test -n "$$(git status --porcelain)" && echo '+CHANGES' || true)

TARGET := checklist
VERSION := $(shell git rev-parse --short HEAD)

GPG_SIGNING_KEY :=

.PHONY: \
	help \
	fmt \
	vet \
	errors \
	version

all: errors vet

help:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@echo '    help               Show this help screen.'
	@echo '    fmt                Run go fmt.'
	@echo '    vet                Run go vet.'
	@echo '    errors             Run errcheck.'
	@echo '    version            Display Go version.'
	@echo ''
	@echo 'Targets run by default are: errors vet'
	@echo ''

vet:
	go vet ./...

errors:
	errcheck -ignoretests -blank ./...

fmt:
	go fmt ./...

vendor: deps
	godep save

version:
	@go version
