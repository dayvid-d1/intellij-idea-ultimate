FROM  jlesage/baseimage-gui:ubuntu-20.04

RUN snap install intellij-idea-ultimate --classic

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="IntelliJ"
