FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl tcpflow vim jq netcat

ENTRYPOINT bash
