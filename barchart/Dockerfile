# VERSION 1.0.0
FROM ubuntu:14.04
MAINTAINER Bruno Vieira <mail@bmpvieira.com>

RUN apt-get update
RUN apt-get install -y wget curl npm python-pip
RUN pip install data_hacks
RUN npm install n -g
RUN n stable
RUN npm install tool-stream -g

#ADD . /
#ENTRYPOINT /run.sh
ENTRYPOINT tool-stream extractProperty number_of_chromosomes | grep -v 0|uniq -c| awk '{print $2 " "$1}' |  bar_chart.py --sort-keys --agg-values | sort -n
