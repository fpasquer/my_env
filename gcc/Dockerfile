#container to write source code with vim
FROM alpine:3.7

MAINTAINER Florian PASQUEREAU <florianpasquereau37@gmail.com>

#update container
RUN apk add --update bash &&\
	apk update &&\
	apk upgrade

RUN apk add --no-cache build-base

WORKDIR "/root"
ENTRYPOINT ["/bin/bash"]
