# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jqueijo- <jqueijo-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/29 11:10:42 by jqueijo-          #+#    #+#              #
#    Updated: 2025/07/31 12:07:25 by jqueijo-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SCR_PATH=./secrets
DATA_PATH=/home/jqueijo-/data
DC=docker compose -f ./srcs/docker-compose.yml

all: new

new:
	mkdir -p $(DATA_PATH)
	mkdir -p $(DATA_PATH)/wordpress
	mkdir -p $(DATA_PATH)/mariadb
	mkdir -p $(SCR_PATH)
	touch $(SCR_PATH)/dbName.txt \
		$(SCR_PATH)/dbUser.txt \
		$(SCR_PATH)/dbPassword.txt \
		$(SCR_PATH)/dbRootPassword.txt \
		$(SCR_PATH)/wpAdminUser.txt \
		$(SCR_PATH)/wpAdminPassword.txt \
		$(SCR_PATH)/wpAdminEmail.txt \
		$(SCR_PATH)/wpUser.txt \
		$(SCR_PATH)/wpUserPassword.txt \

up:
	$(DC) up -d

down:
	$(DC) down

start:
	$(DC) start

stop:
	$(DC) stop

clean:
	$(DC) down --volumes --remove-orphans
# 	docker rmi nginx:42 wordpress:42 mariadb:42
	docker rmi $$(docker images -q) || true

fclean: clean
	docker container prune -f
	docker image prune -f
	docker volume prune -f
	sudo rm -rf $(DATA_PATH)
#	sudo rm -rf $(SCR_PATH)

re: fclean new
