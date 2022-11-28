#!/bin/bash

# workdir is already in the website folder

# if it's there already, it will produce an error and will not download additional files
wp core download --allow-root

# in case the config changed in .env file, we recreate a fresh wp-config file
rm -f wp-config.php
wp core config --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_USER_PASSWORD --dbhost=$WP_DB_HOST --skip-check --allow-root

# now we check if there is a website installed. If not, we install a new one
if ! wp core is-installed --allow-root;
then

wp core install --url=https://artmende.42.fr --title="La maison de Babar" --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_NON_ADMIN_LOGIN $WP_NON_ADMIN_EMAIL --role=editor --user_pass=$WP_NON_ADMIN_PW --allow-root

fi

# telling php-fpm to listen on port 9000
rm -f /etc/php/7.3/fpm/pool.d/www.conf
cp /tools/www.conf /etc/php/7.3/fpm/pool.d/

chown -R www-data:www-data /var/www/html

php-fpm7.3 --nodaemonize
