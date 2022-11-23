#!/bin/bash

cd /var/www/html && wget https://wordpress.org/latest.tar.gz

cd /var/www/html && tar -xf latest.tar.gz

rm -f /var/www/html/latest.tar.gz

mv /tools/wp-config.php /var/www/html/wordpress

rm -f /etc/php/7.3/fpm/pool.d/www.conf
mv /tools/www.conf /etc/php/7.3/fpm/pool.d/

chown -R www-data:www-data /var/www/html

php-fpm7.3 --nodaemonize
