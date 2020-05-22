FROM ubuntu:latest
FROM golang:latest

RUN apt-get update

RUN apt-get install -y make bats curl unzip zip

RUN go get github.com/ericchiang/pup
WORKDIR /usr/app

COPY Makefile $WORKDIR
