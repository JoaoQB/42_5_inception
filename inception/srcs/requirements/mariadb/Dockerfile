FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y mariadb-server

# Clean up APT cache to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy custom MariaDB config
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy init script to system-wide executable location
COPY tools/init.sh /usr/local/bin/init.sh

# Make it executable
RUN chmod +x /usr/local/bin/init.sh

# Ensure MariaDB runtime directory exists
RUN mkdir -p /run/mysqld

# Set permissions for mysql user
RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql /run/mysqld \
  && chmod 755 /run/mysqld

USER mysql

# Set entrypoint to our script
CMD ["init.sh"]
