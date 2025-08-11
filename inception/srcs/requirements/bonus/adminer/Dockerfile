FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y php-fpm php-mysql wget

# Ensure PHP runtime directory exists
RUN mkdir -p /run/php

# Create web root directory where Adminer will live
RUN mkdir -p /var/www/html

RUN wget http://www.adminer.org/latest.php -O /var/www/html/index.php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose port 9000 for FastCGI
EXPOSE 9000

# Start PHP-FPM in the foreground
CMD ["php-fpm7.4", "-F"]
