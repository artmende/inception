all:
	docker build -t nginx_image ./srcs/requirements/nginx/
	docker run -d -p 80:80 -p 443:443 nginx_image

clean:
	docker container stop $$(docker container ls -aq)
	docker container rm $$(docker container ls -aq)
	docker image rm $$(docker image ls -aq)

# fclean:

re: clean all

.PHONY: clean fclean re all
