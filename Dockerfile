FROM ubuntu:17.04
MAINTAINER Ole Kleinschmidt <ok@datenreisende.org>
ENV HOME /go
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV PATH $PATH:/go/bin
ENV GOPATH /go
ENV VCSIM_HOSTS 30
ENV VCSIM_VMS 2000
EXPOSE 443
RUN apt-get update && apt-get -y install tzdata build-essential vim git curl golang
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN echo Europe/Berlin > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN mkdir /go
WORKDIR /go
RUN go get -u github.com/vmware/govmomi/vcsim
ADD ./start /
ENTRYPOINT ["/start"]
