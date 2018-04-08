#container to write compile and execute C
FROM alpine:3.7

MAINTAINER Florian PASQUEREAU <florianpasquereau37@gmail.com>

ENV SHELL=/bin/zsh

#update container
RUN apk add --update zsh &&\
	apk update &&\
	apk upgrade

RUN apk add --no-cache g++ \
	make \
	wget \
	git \
	ncurses-libs \
	ncurses-dev

#execute install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh || true
RUN sed -ie "s/robbyrussell/af-magic/" /root/.zshrc

WORKDIR "/root/"
CMD ["zsh"]
