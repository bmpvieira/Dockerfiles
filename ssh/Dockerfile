# ssh
# Ubuntu that you can SSH into. Can run GUI apps with x11 forward.
#
# VERSION               0.0.1

FROM ubuntu:13.10
MAINTAINER Bruno Vieira <mail@bmpvieira.com>

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update

# Install SSH
RUN apt-get install -y openssh-server ;\
    mkdir /var/run/sshd ;\
    echo 'root:root' |chpasswd

# Fix ubuntu's "stdin: is not a tty" error when connecting with ssh
RUN echo 'tty -s && mesg n' > /root/.profile

EXPOSE 22
CMD /usr/sbin/sshd -D
