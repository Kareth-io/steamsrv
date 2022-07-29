FROM ubuntu:jammy

#This assumes a 64 arch. This means the host that the containers are deployed on need a 64 bit kernel.

ARG DEBIAN_FRONTEND=noninteractive

COPY ./scripts /scripts/

RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note '' | debconf-set-selections

RUN apt-get -qqy update && \
    apt-get -qqy install software-properties-common && \
    add-apt-repository multiverse && \
    dpkg --add-architecture i386

RUN apt-get -qqy update && \
    apt-get -qqy install lib32gcc-s1 steamcmd

RUN mkdir -vp /root/bin/ && ln -s /usr/games/steamcmd /root/bin/steamcmd
