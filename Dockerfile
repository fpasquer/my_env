FROM alpine:3.7

ENV USER_ fpasquer
ENV EMAIL_ fpasquer@student.42.fr

RUN apk add --update bash &&\
	apk update &&\
	apk upgrade

RUN apk add --no-cache make &&\
	apk add --no-cache linux-headers &&\
	apk add --no-cache texinfo &&\
	apk add --no-cache gcc &&\
	apk add --no-cache g++ &&\
	apk add --no-cache gfortran &&\
	apk add --no-cache wget

# install gdb
RUN mkdir gdb-buid ;\
	cd gdb-buid ;\
	wget https://ftp.gnu.org/gnu/gdb/gdb-7.12.1.tar.xz ;\
	tar -xvf gdb-7.12.1.tar.xz ;\
	cd gdb-7.12.1 ;\
	./configure --prefix=/usr ;\
	make ;\
	make -C gdb install ;\
	cd / ;\
	rm -rf gdb-buid

# install vim
RUN apk add --no-cache git ;\
	apk add --no-cache ctags ;\
	apk add --no-cache libx11-dev ;\
	apk add --no-cache libxpm-dev ;\
	apk add --no-cache libxt-dev ;\
	apk add --no-cache ncurses-dev ;\
	apk add --no-cache python;\
	apk add --no-cache python-dev ;\
	git clone https://github.com/vim/vim.git ;\
	cd vim/src ;\
	make ;\
	make install ;\
	cd / ;\
	rm -rf vim

# install valgrind
RUN apk add --no-cache valgrind

# install oh-my-zsh
RUN apk add --no-cache zsh ;\
	mkdir zsh-build ;\
	cd zsh-build ;\
	bash -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" ;\
	cd / ;\
	rm -rf zsh-build

# inctall gdb-peda
RUN apk add --no-cache nasm ;\
	apk add --no-cache busybox ;\
	wget http://github.com/longld/peda/archive/master.zip ;\
	busybox unzip master.zip ;\
	echo 'alias gdb-peda="gdb -x /peda-master/peda.py"' >> /root/.zshrc ;\
	rm -rf master.zip

# install sublivim
RUN bash -c "$(wget http://install.sublivim.com -O -)"

# install header 42
RUN echo 'export USER42="$USER_"' >> /root/.zshrc ;\
	echo 'export MAIL42="$EMAIL_"' >> /root/.zshrc ;\
	wget https://raw.githubusercontent.com/QuentinPerez/42-toolkit/master/srcs/vim/header/make_header.vim  ;\
	mkdir -p ~/.vim/bundle/42header/plugin ;\
	mv make_header.vim ~/.vim/bundle/42header/plugin/

# set variable git
RUN git config --global user.email "$EMAIL_" &&\
	git config --global user.name "$USER_"

# prepare le shell
CMD ["zsh"]
RUN sed -ie "s/robbyrussell/af-magic/" /root/.zshrc
WORKDIR "/root"
