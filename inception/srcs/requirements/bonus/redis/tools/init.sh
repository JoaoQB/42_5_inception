#!/bin/bash

set -e

# Disable daemon mode to keep Redis running in the foreground as PID 1 in the container
sed -i 's/^daemonize .*/daemonize no/' /etc/redis/redis.conf

# Bind Redis to all network interfaces to allow connections from other containers
sed -i 's/^bind .*/bind 0.0.0.0/' /etc/redis/redis.conf

# Disable protected mode, which restricts Redis to local connections only (safe in container networks)
sed -i 's/^protected-mode .*/protected-mode no/' /etc/redis/redis.conf

# Set maximum memory usage limit to 125 MB
sed -i 's/^#\?\s*maxmemory .*/maxmemory 125mb/' /etc/redis/redis.conf

# Set eviction policy to allkeys-lru to remove least recently used keys when memory limit is reached
sed -i 's/^#\?\s*maxmemory-policy .*/maxmemory-policy allkeys-lru/' /etc/redis/redis.conf

exec redis-server /etc/redis/redis.conf
