FROM ubuntu

RUN apt update
RUN apt install -y curl tcpflow vim jq netcat kafkacat redis-tools

ENTRYPOINT bash
