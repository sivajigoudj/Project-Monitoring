# Use a lightweight base image
FROM debian:bullseye-slim

# Install required dependencies
RUN apt-get update && apt-get install -y \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Copy the exporter tarball into the container and extract it directly to /bin
COPY memcached_exporter-0.15.0.linux-amd64.tar.gz /tmp
RUN tar -xzf /tmp/memcached_exporter-0.15.0.linux-amd64.tar.gz -C /bin --strip-components=1 \
    && rm /tmp/memcached_exporter-0.15.0.linux-amd64.tar.gz

# Change ownership and switch to a non-root user
RUN chown nobody:nogroup /bin/memcached_exporter
USER nobody

# Expose the default metrics port
EXPOSE 9150

# Set the entrypoint to the exporter binary
ENTRYPOINT ["/bin/memcached_exporter"]

