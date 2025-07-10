FROM prom/prometheus:latest

COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY alert_rules.yml /etc/prometheus/alert_rules.yml

WORKDIR /prometheus

USER nobody

EXPOSE 9090

VOLUME [ "/prometheus" ]

ENTRYPOINT [ "/bin/prometheus" ]

CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
      "--storage.tsdb.path=/prometheus", \
      "--web.console.templates=/etc/prometheus/consoles", \
      "--web.console.libraries=/etc/prometheus/console_libraries" ]
