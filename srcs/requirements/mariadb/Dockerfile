FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

RUN mkdir /tools

COPY ./tools/* /tools/

CMD ["bash", "/tools/mariadb_script.sh"]
