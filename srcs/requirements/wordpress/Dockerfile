FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget php7.3 php7.3-fpm php7.3-mysql -y

RUN mkdir /tools

COPY ./tools/* /tools/

RUN mkdir -p /www_folder
RUN mkdir -p /run/php

CMD ["bash", "/tools/wordpress_script.sh"]
