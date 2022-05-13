FROM ubuntu:latest

ENV UZ=American/NewYork

RUN \
    apt update && \
    apt install -y pcmanfm featherpad lxtask xterm

ENV DISPLAY=hot.docker.internal:0.0

CMD pcmanfm
