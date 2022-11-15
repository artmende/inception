FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

CMD ["mysqld_safe"]
