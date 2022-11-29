FROM bitnami/kafka as kafka

FROM ubuntu as libserdes-builder
COPY libserdes libserdes
WORKDIR libserdes
RUN apt update
RUN apt install -y libjansson-dev libcurl-gnutls-dev wget
RUN wget http://apache.mirrors.spacedump.net/avro/stable/c
RUN wget http://apache.mirrors.spacedump.net/avro/stable/cpp
RUN ./configure
RUN make
RUN make install



FROM ubuntu as kcat-builder

COPY kcat kcat
WORKDIR kcat
RUN apt update
RUN apt install -y librdkafka-dev libyajl-dev libavro-dev wget gnupg2
RUN wget -qO - https://packages.confluent.io/deb/7.2/archive.key | apt-key add -

FROM ubuntu

RUN apt update
RUN apt install -y curl tcpflow vim jq netcat kafkacat redis-tools dig

COPY --from=kafka /opt/bitnami /opt/bitnami
ENV PATH /opt/bitnami/kafka/bin:/opt/bitnami/java/bin:/opt/bitnami/java/bin:/opt/bitnami/common/bin:/opt/bitnami/kafka/bin:$PATH

ENTRYPOINT bash
