LOGIN = jrasamim
COMPOSE = docker compose -f ./srcs/docker-compose.yml

.PHONY : build run stop re clear

all : build

build :
	mkdir -p /home/$(LOGIN)/data/wordpress
	mkdir -p /home/$(LOGIN)/data/mariadb
	$(COMPOSE) build

run :
	$(COMPOSE) up -d
	$(COMPOSE) ps

stop :
	$(COMPOSE) down

clear :
	make stop
	docker system prune -af --volumes

re :
	make stop
	make build
	make run
