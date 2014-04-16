# SeqGrapheR
# Ubuntu with R and SeqGrapher, which is a GUI for graph based visualization of cluster
# of DNA sequence reads. You can connect with ssh and run it (see bmpvieira/ssh).
#
# VERSION 0.0.1

FROM bmpvieira/r-lang
MAINTAINER Bruno Vieira <mail@bmpvieira.com>

# Set noninteractive installs
ENV DEBIAN_FRONTEND noninteractive

# Install SeqGrapheR Ubuntu repository dependencies
RUN apt-get install -y gtk+2.0 r-cran-rggobi r-cran-cairodevice xvfb

# Setup an headless x11 to manage to pass SeqGrapheR lazyLoading during install

# Add script to install SeqGrapheR along with other R dependencies
ADD scripts /scripts
RUN /scripts/headlessX_seqgrapher_install.sh

# Allow connecting with ssh
EXPOSE 22
CMD /usr/sbin/sshd -D
