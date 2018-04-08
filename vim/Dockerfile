#container to write source code with vim
FROM alpine:3.7

MAINTAINER Florian PASQUEREAU <florianpasquereau37@gmail.com>

#update container
RUN apk add --update zsh &&\
	apk update &&\
	apk upgrade

ENV MAIL42=fpasquer@student.42.fr
ENV USER42=fpasquer
ENV SHELL=/bin/zsh

#install vim and dependences
RUN apk add --no-cache vim \
	wget \
	git

#execute install sublime-vim
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true &&\
	wget http://install.sublivim.com -O - | sh || true

# install header 42
RUN wget https://raw.githubusercontent.com/QuentinPerez/42-toolkit/master/srcs/vim/header/make_header.vim  &&\
	mkdir -p ~/.vim/bundle/42header/plugin &&\
	mv make_header.vim ~/.vim/bundle/42header/plugin/

WORKDIR "/root/"
CMD ["/usr/bin/vim"]
