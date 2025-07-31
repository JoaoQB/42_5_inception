#!/bin/bash

set -e

DB_NAME=$(cat /run/secrets/db_name)
DB_USER=$(cat /run/secrets/db_user)
DB_PASSWORD=$(cat /run/secrets/db_password)
DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)


if [ ! -f /etc/mysql/init.sql ]; then
  cat > "/etc/mysql/init.sql" << EOF
-- Create database
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;

-- Create user for WordPress (remote container access)
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' WITH GRANT OPTION;

-- Set root password (local access only)
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

-- Flush to apply
FLUSH PRIVILEGES;
EOF

  mysql_install_db
fi

mysqld
