FROM  jlesage/baseimage-gui:ubuntu-20.04

RUN \
    apt update && \
    apt install -y pcmanfm featherpad lxtask xterm

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="Pcmanfm"
