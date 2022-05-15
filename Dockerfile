FROM  jlesage/baseimage-gui:ubuntu-20.04

ENV container docker
ENV PATH /snap/bin:$PATH
ADD snap /usr/local/bin/snap

RUN \
  apt update && \
  apt install -y snapd squashfuse fuse

RUN systemctl enable snapd
STOPSIGNAL SIGRTMIN+3

COPY snappy.sh /snappy.sh

RUN . ./snappy.sh

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="IntelliJ"
