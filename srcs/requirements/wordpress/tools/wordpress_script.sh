#!/bin/bash

cd /www_folder && wget https://wordpress.org/latest.tar.gz

cd /www_folder && tar -xf latest.tar.gz

rm -f /www_folder/latest.tar.gz

mv /tools/wp-config.php /www_folder/wordpress

php-fpm7.3 --nodaemonize
