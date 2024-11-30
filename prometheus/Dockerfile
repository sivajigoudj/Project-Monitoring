# Use the official Prometheus image instead of building from source
FROM prom/prometheus:latest

# Set metadata labels (optional but good practice)
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"
LABEL org.opencontainers.image.source="https://github.com/prometheus/prometheus"

# Copy the prometheus.yml configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Set the working directory
WORKDIR /prometheus

# Switch to a non-privileged user
USER nobody

# Expose the Prometheus port
EXPOSE 9090

# Define volumes to persist data (e.g., Prometheus data)
VOLUME [ "/prometheus" ]

# Set the entrypoint for the Prometheus container
ENTRYPOINT [ "/bin/prometheus" ]

# Define default command to run Prometheus with configuration file and storage path
CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
      "--storage.tsdb.path=/prometheus" ]
