
FROM ubuntu as libserdes-builder
COPY libserdes libserdes
WORKDIR libserdes
RUN apt update
RUN apt install -y libjansson-dev libcurl4-gnutls-dev wget
RUN wget http://apache.mirrors.spacedump.net/avro/stable/c
RUN wget http://apache.mirrors.spacedump.net/avro/stable/cpp
RUN ./configure
RUN make
RUN make install

ENTRYPOINT bash
