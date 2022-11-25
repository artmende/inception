#!/bin/bash

# chown -R mysql:mysql /var/lib/mysql
# mkdir -p /var/run/mysqld
# mkfifo /var/run/mysqld/mysqld.sock
# touch /var/run/mysqld/mysqlf.pid
# chown -R mysql:mysql /var/run/mysqld

rm -f /etc/mysql/mariadb.cnf
cp /tools/mariadb.cnf /etc/mysql/

echo "before start"


service mysql start

echo "before create database with name $WORDPRESS_DB_NAME" && echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
echo "before create user" && echo "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_USER_PASSWORD';" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
echo "before grant" && echo "GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
# echo "UPDATE mysql.user SET Password=PASSWORD('YOURNEWPASSWORDD') WHERE User='root';" | mariadb -u root --skip-password
echo "before flush" && echo "FLUSH PRIVILEGES;" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
echo "after flush"
mysqladmin -u root password $MARIADB_ROOT_PASSWORD
# echo "update mysql.user set plugin='' where user='root';" | mariadb -u root --skip-password; what's that ?

echo "before all those commands"



echo "after all those commands"

service mysql stop

echo "after stop"



mysqld_safe

