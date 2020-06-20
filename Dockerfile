FROM ubuntu:latest
FROM golang:latest

RUN apt-get update

RUN apt-get install -y make unzip zip jq

RUN go get github.com/ericchiang/pup
WORKDIR /work

ENV DOMAIN $DOMAIN

# RUN make build
#
# CMD framework/start
