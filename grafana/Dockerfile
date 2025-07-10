FROM grafana/grafana:latest

USER root


RUN mkdir -p /var/lib/grafana-plugins && \
    chown -R grafana:root /var/lib/grafana-plugins

ENTRYPOINT ["/usr/share/grafana/bin/grafana-server"]
CMD ["server"]
