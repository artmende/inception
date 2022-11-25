#!/bin/bash

echo "before if"

if [ ! -d "/var/www/html/wordpress" ];
then

echo "inside if"

cd /var/www/html && wget https://wordpress.org/latest.tar.gz

cd /var/www/html && tar -xf latest.tar.gz

rm -f /var/www/html/latest.tar.gz

cp /tools/wp-config.php /var/www/html/wordpress

fi

rm -f /etc/php/7.3/fpm/pool.d/www.conf
cp /tools/www.conf /etc/php/7.3/fpm/pool.d/

echo "after if"

chown -R www-data:www-data /var/www/html

php-fpm7.3 --nodaemonize
