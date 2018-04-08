FROM alpine:3.7
MAINTAINER Florian PASQUEREAU <florianpasquereau37@gmail.com>

#update container
RUN apk add --update zsh &&\
	apk update &&\
	apk upgrade

RUN apk add --no-cache valgrind

WORKDIR "/root/"
ENTRYPOINT ["/usr/bin/valgrind", "--leak-check=full", "--show-leak-kinds=all"]
CMD ["./a.out"]
