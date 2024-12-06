#!/bin/bash
# Init script for Master Database

# Start MariaDB server
mysql --user=root --password=$MYSQL_ROOT_PASSWORD <<EOF
CREATE DATABASE IF NOT EXISTS testdb;
CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
EOF

