FROM bitnami/kafka as kafka
FROM ubuntu

RUN apt update
RUN apt install -y curl tcpflow vim jq netcat kafkacat redis-tools

COPY --from=kafka /opt/bitnami /opt/bitnami
ENV PATH /opt/bitnami/kafka/bin:/opt/bitnami/java/bin:/opt/bitnami/java/bin:/opt/bitnami/common/bin:/opt/bitnami/kafka/bin:$PATH

ENTRYPOINT bash
