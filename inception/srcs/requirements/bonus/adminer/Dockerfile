FROM debian:11

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y php-fpm php-mysql wget

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html

RUN wget http://www.adminer.org/latest.php -O /var/www/html/index.php

COPY ./conf/www.conf /etc/php/*/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
