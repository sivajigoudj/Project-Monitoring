# Start with a basic image (Debian slim in this case)
FROM debian:bullseye-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy the node_exporter tarball into the container
COPY node_exporter-1.8.2.linux-amd64.tar.gz /tmp/

# Create a directory for node_exporter binary in /bin
RUN tar -xvf /tmp/node_exporter-1.8.2.linux-amd64.tar.gz -C /bin --strip-components=1 \
    && rm /tmp/node_exporter-1.8.2.linux-amd64.tar.gz

# Expose the port that Node Exporter listens on
EXPOSE 9100

# Set the working directory
WORKDIR /bin

# Run node_exporter from the /bin directory
CMD ["/bin/node_exporter"]
