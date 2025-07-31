#!/bin/sh

set -e

DB_NAME=$(cat /run/secrets/db_name)
DB_USER=$(cat /run/secrets/db_user)
DB_PASSWORD=$(cat /run/secrets/db_password)
WP_ADMIN_USER=$(cat /run/secrets/wp_admin_user)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)
WP_ADMIN_EMAIL=$(cat /run/secrets/wp_admin_email)
WP_USER=$(cat /run/secrets/wp_user)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)

WP_URL="https://${DOMAIN_URL}"
TITLE="${WP_TITLE:-WordPress Site}"

if ! wp core is-installed --allow-root; then
  wp config create \
    --dbname="${DB_NAME}" \
    --dbuser="${DB_USER}" \
    --dbpass="${DB_PASSWORD}" \
    --dbhost="${DB_HOST}" \
    --allow-root
  wp core install \
    --url="${WP_URL}" \
    --title="${TITLE}" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --allow-root
  wp user create \
    "${WP_USER}" \
    "${WP_USER}"@"$HOSTNAME".com \
    --role=author \
    --user_pass="${WP_USER_PASSWORD}" \
    --allow-root
  wp theme install twentytwentythree --activate --allow-root
  wp plugin install redis-cache --activate --allow-root
  wp plugin update --all --allow-root
  wp config set WP_REDIS_HOST 'redis' --type=constant --allow-root
  wp config set WP_REDIS_PORT "${REDIS_PORT}" --type=constant --raw --allow-root
  wp config set WP_CACHE true --type=constant --raw --allow-root
  wp config set WP_CACHE_KEY_SALT 'inception_wp_' --type=constant --allow-root
  wp redis enable --allow-root
fi

exec php-fpm7.4 -F
