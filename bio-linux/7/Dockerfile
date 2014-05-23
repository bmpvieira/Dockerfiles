# bio-linux:7
# Based on phusion's Docker friendly Ubuntu 12.04 image with Bio-Linux 7 and R repositories.

FROM phusion/baseimage:0.9.9

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Regenerate SSH host keys.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Bio-Linux 7 repositories
RUN echo 'deb http://nebc.nerc.ac.uk/bio-linux/ unstable bio-linux' >> /etc/apt/sources.list ;\
    echo 'deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list ;\
    echo 'deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main' >> /etc/apt/sources.list ;\
    echo 'deb http://cran.r-project.org/bin/linux/ubuntu precise/' >> /etc/apt/sources.list ;\
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 ;\
    apt-get update ;\
    apt-get install -y --force-yes bio-linux-keyring ;\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
