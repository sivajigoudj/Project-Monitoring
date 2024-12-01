#!/bin/bash
set -e

# Initialize database if not already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
    echo "Database initialized."
fi

# Start MariaDB
echo "Starting MariaDB..."
exec "$@"
