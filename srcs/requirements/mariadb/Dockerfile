FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

RUN mkdir /tools

COPY ./tools/* /tools/

# RUN service mysql start

# RUN echo "CREATE DATABASE wordpress;" | mariadb -u root --skip-password
# RUN echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mariadb -u root --skip-password
# RUN echo "FLUSH PRIVILEGES;" | mariadb -u root --skip-password
# RUN echo "update mysql.user set plugin='' where user='root';" | mariadb -u root --skip-password;

# RUN service mysql stop

CMD ["bash", "/tools/mariadb_script.sh"]

# CMD ["mysqld_safe"]
