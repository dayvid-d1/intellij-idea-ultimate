FROM ubuntu:latest

RUN \
    apt update && \
    apt install -y pcmanfm featherpad lxtask xterm

ENV DISPLAY=localhost:0.0

CMD pcmanfm
