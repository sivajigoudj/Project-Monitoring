FROM grafana/grafana:latest

USER root

# Create necessary directories and set permissions
RUN mkdir -p /var/lib/grafana-plugins && \
    chown -R grafana:root /var/lib/grafana-plugins

# Ensure correct execution of the grafana-server binary
ENTRYPOINT ["/usr/share/grafana/bin/grafana-server"]
CMD ["server"]
