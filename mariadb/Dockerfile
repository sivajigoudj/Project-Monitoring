# Start from the official Ubuntu base image
FROM ubuntu:22.04

# Create the "mysql" group and user with consistent IDs
RUN groupadd -r mysql && useradd -r -g mysql mysql --home-dir /var/lib/mysql

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    gpg \
    xz-utils \
    zstd \
    libjemalloc2 \
    pwgen \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Add gosu for step-down from root
ENV GOSU_VERSION=1.17
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        dirmngr \
        gnupg; \
    ARCH="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -q -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$ARCH"; \
    wget -q -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$ARCH.asc"; \
    GNUPGHOME="$(mktemp -d)"; \
    export GNUPGHOME; \
    gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 || \
    gpg --batch --keyserver keyserver.ubuntu.com --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \
    chmod +x /usr/local/bin/gosu; \
    gosu --version; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false dirmngr gnupg

# Add MariaDB repository
ARG MARIADB_VERSION=10.11
RUN set -eux; \
    echo "deb [arch=$(dpkg --print-architecture)] http://mirror.netinch.com/mariadb/repo/$MARIADB_VERSION/ubuntu jammy main" > /etc/apt/sources.list.d/mariadb.list; \
    wget -q https://mariadb.org/mariadb_release_signing_key.asc -O- | gpg --dearmor -o /usr/share/keyrings/mariadb-archive-keyring.gpg; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    mariadb-server \
    mariadb-backup \
    socat \
    && rm -rf /var/lib/apt/lists/*

# Prepare MariaDB directories and permissions
RUN set -eux; \
    rm -rf /var/lib/mysql /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf; \
    mkdir -p /var/lib/mysql /run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld; \
    chmod 1777 /run/mysqld

# Configuration adjustments
RUN echo -e "[mariadb]\nhost-cache-size=0\nskip-name-resolve\n" > /etc/mysql/mariadb.conf.d/05-skipcache.cnf

# OCI Annotations
LABEL org.opencontainers.image.authors="MariaDB Community" \
      org.opencontainers.image.title="MariaDB Database" \
      org.opencontainers.image.description="MariaDB Database for relational SQL" \
      org.opencontainers.image.documentation="https://hub.docker.com/_/mariadb/" \
      org.opencontainers.image.base.name="docker.io/library/ubuntu:22.04" \
      org.opencontainers.image.licenses="GPL-2.0" \
      org.opencontainers.image.source="https://github.com/MariaDB/mariadb-docker" \
      org.opencontainers.image.vendor="MariaDB Community" \
      org.opencontainers.image.version="$MARIADB_VERSION"

# Add healthcheck and entrypoint scripts
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/healthcheck.sh /usr/local/bin/docker-entrypoint.sh

# Define volumes, ports, and entrypoint
VOLUME /var/lib/mysql
EXPOSE 3306
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]
