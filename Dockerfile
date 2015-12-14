FROM gliderlabs/alpine

RUN apk --update add go
RUN apk --update add git
RUN apk --update add mercurial
RUN apk --update add openssh-client
RUN apk --update add ca-certificates
RUN apk --update add vim curl
RUN apk --update add curl
RUN apk --update add perl
RUN apk --update add ruby
RUN apk --update add ack

RUN adduser -D dev

WORKDIR /home/dev
ENV HOME /home/dev
ENV LC_ALL en_US.UTF-8

RUN mkdir -p $HOME/go/src $HOME/go/bin && chmod -R 777 $HOME
ENV GOPATH $HOME/go
ENV PATH $HOME/go/bin:$PATH

RUN mkdir $HOME/.vim
RUN curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY vimrc $HOME/.vimrc

RUN vim +PlugInstall +qall
RUN vim +GoInstallBinaries +qall

RUN echo "colorscheme itg_flat" >> $HOME/.vimrc

CMD ["/bin/sh"]
