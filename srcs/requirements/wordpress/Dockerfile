FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget php7.3 php7.3-fpm -y
RUN apt-get install php7.3-mysql -y

RUN mkdir /tools

COPY ./tools/* /tools/

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php
RUN mkdir -p /tools/wordpress_files

# downloading and installing wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# downloading wordpress files, so we have them in the cache when executing the entrypoint script
RUN cd /tools/wordpress_files && wp core download --allow-root

WORKDIR /var/www/html

CMD ["bash", "/tools/wordpress_script.sh"]
