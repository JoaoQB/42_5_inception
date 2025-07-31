FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y redis-server

# Clean up APT cache to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your startup script into container
COPY ./tools/init.sh /usr/local/bin/redis-start.sh

# Make script executable
RUN chmod +x /usr/local/bin/redis-start.sh

# Default Redis port
EXPOSE 6379

CMD ["/usr/local/bin/redis-start.sh"]
