FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

# generating self signed SSL certificate and key
RUN openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/ssl/nginx-selfsigned.crt \
			-keyout /etc/ssl/nginx-selfsigned.key \
			-subj "/C=BE/ST=BRU/L=1000-Bruxelles/O=42NETWORK/OU=s19/CN=localhost"

RUN mkdir /tools

COPY ./tools/* /tools/

EXPOSE 443

CMD ["bash", "/tools/nginx_script.sh"]
