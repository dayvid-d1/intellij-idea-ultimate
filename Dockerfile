FROM  jlesage/baseimage-gui:ubuntu-20.04

ENV container docker
ENV PATH /snap/bin:$PATH
ADD snap /usr/local/bin/snap
COPY startapp.sh /startapp.sh
ENV APP_NAME="IntelliJ"

RUN \
  apt update && \
  apt install -y snapd squashfuse fuse && \
  chmod +x /usr/local/bin/snap

STOPSIGNAL SIGRTMIN+3

RUN . /usr/local/bin/snap
