FROM debian:stable-slim

ENV ONTOLOGY_VERSION=1.8.2
ENV ONTOLOGY_CHECKSUM=aebb43eccd37b1178c82003d98d562cdd156303978948f3f23fee0048f076a66

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/ontio/ontology/releases/download/v${ONTOLOGY_VERSION}/ontology-linux-amd64 \
    && echo "${ONTOLOGY_CHECKSUM} ontology-linux-amd64" | sha256sum -c \
    && cp ontology-linux-amd64 /usr/local/bin/ontology \
    && chmod +x /usr/local/bin/ontology \
    && rm ontology-linux-amd64

ENTRYPOINT ["/usr/local/bin/ontology"]
