FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx

EXPOSE 80 443

RUN mkdir /tools

COPY ./tools/* /tools/

CMD ["bash", "/tools/nginx_script.sh"]

# CMD ["nginx", "-g", "daemon off;"]

# CMD nginx -g "daemon off;"
