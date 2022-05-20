FROM  jlesage/baseimage-gui:ubuntu-20.04 AS base

COPY startapp.sh /startapp.sh
ENV APP_NAME="IntelliJ"

ARG IDEA_VERSION=2022.1
ARG IDEA_BUILD=2022.1.1

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  gcc git openssh-client less curl software-properties-common \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \  
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms /bin/bash developer

RUN add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get install -y ant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/ && \
    rm -rf /var/cache/oracle-jdk8-installer;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
    
# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV IDE_BIN_HOME=/opt/idea/bin/
ENV PATH=$JAVA_HOME/bin:$PATH
ENV IDEA_PROPERTIES=/opt/idea/bin/idea.properties
RUN export JAVA_HOME \
&& export IDE_BIN_HOME \
&& export JRE_HOME \
&& export PATH \
&& export IDEA_PROPERTIES

ARG idea_source=https://download.jetbrains.com/idea/ideaIU-${IDEA_BUILD}.tar.gz
ARG idea_local_dir=.IntelliJIdea${IDEA_VERSION}

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz \
  && mkdir -p /home/developer \
  && chmod 777 /home/developer
  

ENV HOME /home/developer

RUN mkdir /home/developer/.Idea \
  && ln -sf /home/developer/.Idea /home/developer/$idea_local_dir
