FROM python:3.14-alpine

LABEL org.opencontainers.image.authors="Marco Walther <marco@sonic.net>"
LABEL org.opencontainers.image.description="An implementation of a Prometheus exporter for Emporia Vue power monitoring devices"
LABEL org.opencontainers.image.source=https://github.com/mw46d/emvue_exporter
LABEL org.opencontainers.image.licenses=GPL-3.0

COPY . /app
RUN cd /app && \
    pip install . && \
    cd / && \
    rm -rf /app

CMD ["/usr/local/bin/emvue_exporter"]
