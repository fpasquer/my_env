FROM alpine:3.7
MAINTAINER Florian PASQUEREAU <florianpasquereau37@gmail.com>

#update container
RUN apk add --update zsh &&\
	apk update &&\
	apk upgrade

WORKDIR "/root/"
CMD ["./a.out"]
