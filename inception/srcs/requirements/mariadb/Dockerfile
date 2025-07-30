FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y mariadb-server

# Clean cached files to reduce image size
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Ensure PHP runtime directory exists
RUN mkdir -p /run/mysqld
