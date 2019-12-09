FROM debian:stable-slim

ENV ONTOLOGY_VERSION=1.8.1
ENV ONTOLOGY_CHECKSUM=90823652b143147ee72d9b9b2ba7a3e153238cb6c29e10f0a8ed6e0e97bd6a09

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/ontio/ontology/releases/download/v${ONTOLOGY_VERSION}/ontology-linux-amd64 \
    && echo "${ONTOLOGY_CHECKSUM} ontology-linux-amd64" | sha256sum -c \
    && cp ontology-linux-amd64 /usr/local/bin/ontology \
    && chmod +x /usr/local/bin/ontology \
    && rm ontology-linux-amd64

ENTRYPOINT ["/usr/local/bin/ontology"]
