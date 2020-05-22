FROM ubuntu:latest
FROM golang:latest

RUN apt-get update

RUN apt-get install -y make bats curl unzip zip jq

RUN go get github.com/ericchiang/pup
WORKDIR /work
