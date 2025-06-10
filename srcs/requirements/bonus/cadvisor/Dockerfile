FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install wget -y

WORKDIR /usr/local/bin

#0.44.0 de preference
RUN wget https://github.com/google/cadvisor/releases/download/v0.39.0/cadvisor
RUN chmod +x cadvisor

ENTRYPOINT	[ "cadvisor" ]
