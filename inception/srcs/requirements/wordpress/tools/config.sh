#!/bin/sh

set -e

if [ ! -f /var/www/html/wp-config.php ]; then
  wp config create
fi
