#!/bin/bash

# Wait for MariaDB to be ready
sleep 5

# Set up WordPress if not already installed
if [ ! -f "wp-config.php" ]; then
    # Download WordPress core
    wp core download --allow-root

    # Create wp-config.php
    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_USER_PWD" \
        --dbhost="mariadb" \
        --allow-root

    # Install WordPress core
    wp core install \
        --url="https://${LOGIN}.42.fr" \
        --title="$WP_TITLE" \
        --admin_name="$WP_ADMIN_NAME" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    # Create secondary user
    wp user create \
        "$WORDPRESS_USER" \
        "$WORDPRESS_USER_EMAIL" \
        --role=author \
        --user_pass="$WORDPRESS_USER_PASSWORD" \
        --allow-root

    wp theme activate twentytwentyfour --allow-root
    # Set correct permissions
    chown -R www-data:www-data /var/www/html
fi

# if already install 
echo "WordPress is already installed"

# Execute CMD (php-fpm)
echo "Starting php-fpm..."
mkdir -p /run/php/
php-fpm7.4 -F
