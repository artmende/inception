
COMPOSE_FILE = ./srcs/docker-compose.yml

PROJECT_NAME = lemp_artmende

COMPOSE_FLAGS = --file $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

UP_FLAGS = --detach

all:
	mkdir -p ~/data/www
	mkdir -p ~/data/db
	rm -f ~/.docker/config.json
	docker compose $(COMPOSE_FLAGS) up $(UP_FLAGS)
# docker compose --file ./srcs/docker-compose.yml --project-name LEMP_artmende up --detach

down:
	docker compose $(COMPOSE_FLAGS) down

clean: down
	docker system prune -af
#	docker image rm $$(docker image ls -a | grep lemp_artmende | awk '{print $$3}')
# docker prune with or without volume option

fclean: clean
	docker volume rm $$(docker volume ls -q)

re: clean all

.PHONY: all down clean fclean re
