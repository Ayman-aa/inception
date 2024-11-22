#!/bin/bash

# Start MariaDB
service mariadb start

# Wait for MariaDB to start
sleep 5

# Create database and user if they do not exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';"

# Stop MariaDB
service mariadb stop

# Start the MariaDB daemon
exec mysqld