# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jqueijo- <jqueijo-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/29 11:10:42 by jqueijo-          #+#    #+#              #
#    Updated: 2025/07/29 14:39:15 by jqueijo-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

fclean :
	docker compose -f ./srcs/docker-compose.yml down
	docker container prune -f
	docker image prune -f
	docker rmi nginx:42

re: fclean all
