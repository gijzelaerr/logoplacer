FROM ubuntu:17.04
MAINTAINER gijsmolenaar@gmail.com

ENV DEBIAN_FRONTEND noninteractive

ADD docker-apt-install /usr/local/bin
ADD requirements.txt /

RUN docker-apt-install python-opencv python-pip git python-scipy

RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
