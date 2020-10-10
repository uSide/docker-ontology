FROM debian:stable-slim

ENV ONTOLOGY_VERSION=2.1.0
ENV ONTOLOGY_CHECKSUM=717b226a15b18c405ec9dd1da781769c9fcafacf964b777675ed9fb5dc153876

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/ontio/ontology/releases/download/v${ONTOLOGY_VERSION}/ontology-linux-amd64 \
    && echo "${ONTOLOGY_CHECKSUM} ontology-linux-amd64" | sha256sum -c \
    && cp ontology-linux-amd64 /usr/local/bin/ontology \
    && chmod +x /usr/local/bin/ontology \
    && rm ontology-linux-amd64

ENTRYPOINT ["/usr/local/bin/ontology"]
