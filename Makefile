.DEFAULT_GOAL := all

EXECUTABLE=trubka
WINDOWS=./bin/windows_amd64
LINUX=./bin/linux_amd64
DARWIN=./bin/darwin_amd64
VERSION=$(shell git describe --tags --abbrev=0 | cut -c2-)
PATCH=$(shell echo $(VERSION) | cut -d'.' -f 3)
MAJOR=$(shell echo $(VERSION) | cut -d'.' -f 1 | cut -c2-)
MINOR=$(shell echo $(VERSION) | cut -d'.' -f 2)
COMMIT=$(shell git rev-parse HEAD)
BUILT := $(shell date -u '+%a %d %b %Y %H:%M:%S GMT')
RUNTIME=$(shell go version | cut -d' ' -f 3)

linux:
	@docker build --build-arg='VERSION=$(VERSION)' \
			--build-arg='COMMIT=$(COMMIT)' \
			--build-arg='BUILT=$(COMMIT)' \
			--build-arg='RUNTIME=$(COMMIT)' \
			-t xitonix/build-debian ./release/ubuntu

help: ##  Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

all: linux clean

clean: ## Removes the artifacts.
	@rm -rf $(WINDOWS) $(LINUX) $(DARWIN)

.PHONY: all
