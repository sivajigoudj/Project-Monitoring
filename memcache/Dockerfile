# Use a lightweight base image
FROM debian:bullseye-slim

# Install required dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libevent-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set up a working directory
WORKDIR /usr/local/src/memcached

# Copy the source tarball into the container
COPY memcached-1.6.32.tar.gz .

# Extract the source tarball
RUN tar -xzf memcached-1.6.32.tar.gz && cd memcached-1.6.32 \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf memcached-1.6.32 memcached-1.6.32.tar.gz

# Expose the default Memcached port
EXPOSE 11211

# Set entrypoint to memcached
ENTRYPOINT ["memcached"]

# Run memcached in foreground mode
CMD ["memcached", "-m", "64", "-u", "nobody", "-vv"]

