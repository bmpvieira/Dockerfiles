# Guix
#
# VERSION               1.0.0

FROM gliderlabs/alpine
MAINTAINER Bruno Vieira <mail@bmpvieira.com>

LABEL Description="This is a minimal Linux (Alpine) with GNU Guix package manager" Version="1.0.0"

ENV PATH /root/.guix-profile/bin:$PATH

RUN cd /tmp
RUN wget ftp://alpha.gnu.org/gnu/guix/guix-binary-0.8.3.x86_64-linux.tar.xz
RUN tar xJf guix-binary-0.8.3.x86_64-linux.tar.xz
RUN mv var/guix /var/ && mv gnu /
RUN ln -sf /var/guix/profiles/per-user/root/guix-profile ~root/.guix-profile
RUN guix archive --authorize < ~root/.guix-profile/share/guix/hydra.gnu.org.pub
RUN addgroup guixbuild
RUN addgroup guix-builder
RUN chgrp guix-builder -R /gnu/store
RUN chmod 1775 /gnu/store
RUN builders=10 ;\
  for i in `seq 1 $builders` ; do \
    adduser -S guix-builder$i guix-builder ;\
    adduser guix-builder$i guix-builder ;\
  done
CMD guix-daemon --build-users-group=guix-builder
# RUN guix-daemon --build-users-group=guix-builder & guix pull
