#!/bin/bash

service mysql start

echo "CREATE DATABASE $WORDPRESS_DB_NAME;" | mariadb -u root --skip-password
echo "CREATE USER '$WORDPRESS_DB_USER'@'localhost' IDENTIFIED BY '$WORDPRESS_DB_USER_PASSWORD';" | mariadb -u root --skip-password
echo "GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'localhost';" | mariadb -u root --skip-password
echo "UPDATE mysql.user SET Password=PASSWORD('YOURNEWPASSWORDD') WHERE User='root';" | mariadb -u root --skip-password
echo "FLUSH PRIVILEGES;" | mariadb -u root --skip-password
mysqladmin -u root password $MARIADB_ROOT_PASSWORD
# echo "update mysql.user set plugin='' where user='root';" | mariadb -u root --skip-password; what's that ?

service mysql stop

mysqld_safe

