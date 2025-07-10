
FROM debian:bullseye-slim


RUN apt-get update && apt-get install -y \
    curl \
    tar \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*


COPY node_exporter-1.8.2.linux-amd64.tar.gz /tmp/


RUN tar -xvf /tmp/node_exporter-1.8.2.linux-amd64.tar.gz -C /bin --strip-components=1 \
    && rm /tmp/node_exporter-1.8.2.linux-amd64.tar.gz


EXPOSE 9100


WORKDIR /bin

CMD ["/bin/node_exporter"]
