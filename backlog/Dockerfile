FROM ubuntu:latest
FROM golang:latest

RUN apt-get update

RUN apt-get install -y make unzip zip jq

RUN go get github.com/ericchiang/pup

ENV WEBDIR /usr/local/web
WORKDIR $WEBDIR

COPY dist $WORKDIR/
COPY Procfile $WORKDIR
COPY serve.go $WORKDIR

CMD go run serve.go -p $PORT -d $WEBDIR/dist

