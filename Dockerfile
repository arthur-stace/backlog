FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y make bats curl unzip

RUN curl -o tmp/pup.zip -O -L -C - https://github.com/ericchiang/pup/releases/download/v0.4.0/pup_v0.4.0_linux_386.zip

RUN mkdir -p bin

RUN unzip tmp/pup.zip -d bin/

WORKDIR /usr/app

COPY Makefile $WORKDIR
