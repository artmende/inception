#!/bin/bash

service mysql start

echo "before create database" && echo "CREATE DATABASE $WORDPRESS_DB_NAME;" | mariadb -u root --skip-password
echo "before create user" && echo "CREATE USER '$WORDPRESS_DB_USER'@'localhost' IDENTIFIED BY '$WORDPRESS_DB_USER_PASSWORD';" | mariadb -u root --skip-password
echo "before grant" && echo "GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'localhost';" | mariadb -u root --skip-password
# echo "UPDATE mysql.user SET Password=PASSWORD('YOURNEWPASSWORDD') WHERE User='root';" | mariadb -u root --skip-password
echo "before flush" && echo "FLUSH PRIVILEGES;" | mariadb -u root --skip-password
# mysqladmin -u root password $MARIADB_ROOT_PASSWORD
# echo "update mysql.user set plugin='' where user='root';" | mariadb -u root --skip-password; what's that ?

service mysql stop

rm -f /etc/mysql/mariadb.conf
mv /tools/mariadb.cnf /etc/mysql/

chown -R mysql:mysql /var/lib/mysql
mkdir -p /var/run/mysqld
touch /var/run/mysqld/mysqlf.pid
chown -R mysql:mysql /var/run/mysqld

mysqld_safe

