
COMPOSE_FILE = ./srcs/docker-compose.yml

PROJECT_NAME = lemp_artmende

COMPOSE_FLAGS = --file $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

UP_FLAGS = --detach

all:
	rm -f ~/.docker/config.json
	docker compose $(COMPOSE_FLAGS) up $(UP_FLAGS)
	# docker compose --file ./srcs/docker-compose.yml --project-name LEMP_artmende up --detach

down:
	docker compose $(COMPOSE_FLAGS) down

clean:


# fclean:

re: clean all

.PHONY: clean fclean re all
