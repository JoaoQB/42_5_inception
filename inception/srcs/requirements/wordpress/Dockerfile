FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y php-fpm php-mysqli curl

# Clean cached files to reduce image size
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

# Ensure PHP runtime directory exists
RUN mkdir -p /run/php


ARG PHP_FPM_PORT
# Configure PHP-FPM to listen o`n TCP port 9000 instead of default Unix socket
RUN sed -i "s/^listen = .*/listen = ${PHP_FPM_PORT}/" /etc/php/7.4/fpm/pool.d/www.conf

# Download the WP-CLI Phar (PHP Archive)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make it executable
RUN chmod +x wp-cli.phar

# Move it to a directory in PATH so it can be run with `wp`
RUN mv wp-cli.phar /usr/local/bin/wp

# Set working directory to WordPress document root
WORKDIR /var/www/html

# Use WP-CLI to download core WordPress files into /var/www/html
RUN wp core download --allow-root

# Document that the container listens on port 9000
EXPOSE ${PHP_FPM_PORT}

# Run PHP-FPM in foreground (required for Docker containers)
CMD ["php-fpm7.4", "-F"]
