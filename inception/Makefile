# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jqueijo- <jqueijo-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/29 11:10:42 by jqueijo-          #+#    #+#              #
#    Updated: 2025/07/30 13:39:43 by jqueijo-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	mkdir -p /home/jqueijo-/data
	mkdir -p /home/jqueijo-/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

fclean :
	docker compose -f ./srcs/docker-compose.yml down
	docker container prune -f
	docker image prune -f
	docker volume rm srcs_wordpress_data
	sudo rm -fr /home/jqueijo-/data
# 	docker rmi nginx:42 wordpress:42
	docker rmi $$(docker images -q)

re: fclean all
