
COMPOSE_FILE = ./srcs/docker-compose.yml

PROJECT_NAME = lemp_artmende

COMPOSE_FLAGS = --file $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

UP_FLAGS = --detach

all:
	mkdir -p ~/data/www
	mkdir -p ~/data/db
	rm -f ~/.docker/config.json
	docker compose $(COMPOSE_FLAGS) up $(UP_FLAGS)

down:
	docker compose $(COMPOSE_FLAGS) down

clean: down
	docker system prune -af
# That will stop the containers and delete them, and also delete the images. Volumes are not removed

fclean: clean
	docker volume rm $$(docker volume ls -q)
	sudo rm -rf ~/data/www
	sudo rm -rf ~/data/db
# That remove everything. Containers, images, volumes, and also the files on the host

re: fclean all

.PHONY: all down clean fclean re
