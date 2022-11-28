#!/bin/bash

# chown -R mysql:mysql /var/lib/mysql
# mkdir -p /var/run/mysqld
# mkfifo /var/run/mysqld/mysqld.sock
# touch /var/run/mysqld/mysqlf.pid
# chown -R mysql:mysql /var/run/mysqld
### It seems we don't need the above commands...

# Letting mariadb know we expect client coming fron the network, and specifying the port
rm -f /etc/mysql/mariadb.cnf
cp /tools/mariadb.cnf /etc/mysql/


# we first start mariadb to create database and users. If they are already created, it's okay
service mysql start

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
echo "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_USER_PASSWORD';" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
echo "GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD
echo "FLUSH PRIVILEGES;" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD

mysqladmin -u root password $MARIADB_ROOT_PASSWORD

service mysql stop
# stopping mariadb, so we can restart it with the safe option, that will keep the container running

mysqld_safe
