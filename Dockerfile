FROM  jlesage/baseimage-gui:ubuntu-20.04

ENV container docker
ENV PATH /snap/bin:$PATH
ADD snap /usr/local/bin/snap
COPY startapp.sh /startapp.sh
ENV APP_NAME="IntelliJ"

