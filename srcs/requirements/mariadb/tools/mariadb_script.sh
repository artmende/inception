#!/bin/bash

service mysql start

echo "CREATE DATABASE wordpress;" | mariadb -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mariadb -u root --skip-password
echo "FLUSH PRIVILEGES;" | mariadb -u root --skip-password
echo "update mysql.user set plugin='' where user='root';" | mariadb -u root --skip-password;

service mysql stop

mysqld_safe
