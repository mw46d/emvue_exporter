FROM python:3.12-alpine

EXPOSE 10110

COPY . /app
RUN cd /app && pip install . && cd / && rm -rf /app

CMD ["/usr/local/bin/emvue_exporter"]
