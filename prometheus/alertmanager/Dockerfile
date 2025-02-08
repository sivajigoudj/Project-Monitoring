# Use the official Alertmanager image
FROM prom/alertmanager:latest

# Copy the Alertmanager configuration file
COPY alertmanager.yml /etc/alertmanager/alertmanager.yml

# Expose the Alertmanager port
EXPOSE 9093

# Set the entrypoint for the Alertmanager container
ENTRYPOINT [ "/bin/alertmanager" ]

# Define default command to run Alertmanager with the configuration file
CMD [ "--config.file=/etc/alertmanager/alertmanager.yml", \
      "--storage.path=/alertmanager" ]
