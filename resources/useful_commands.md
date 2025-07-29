# Docker Commands

## List all Docker images
docker images

## List running Docker containers
docker ps

## List all Docker containers (running and stopped)
docker ps -a

## Remove a specific Docker container by ID or name
docker rm <container_id_or_name>

## Remove all stopped Docker containers
docker container prune

## Remove all Docker containers (must be stopped first)
docker rm $(docker ps -a -q)

## Remove a specific Docker image by ID or name
docker rmi <image_id_or_name>

## Remove dangling (unused) Docker images
docker image prune

## Remove all Docker images (be careful!)
docker rmi $(docker images -q)

## Build a Docker image from Dockerfile in current directory
docker build -t <image_name>:<tag> .
	example: docker build -t nginx:Dockerfile .

## Run a Docker container in detached mode with a name
docker run --name <container_name> -d <image_name>:<tag>

## Run a Docker container mapping ports and mounting volumes
docker run --name <container_name> -d -p <host_port>:<container_port> -v <host_path>:<container_path> <image_name>:<tag>

## Run a Bash Terminal Inside Container
docker exec -it <container_name> bash
	example: docker exec -it nginx bash

# Docker Compose Commands

## List Docker Compose containers in current project
docker compose ps

## Build images defined in docker-compose.yml
docker compose build

## Start containers in detached mode (without rebuilding)
docker compose up -d

## Start containers in foreground mode (logs shown in terminal)
docker compose up

## Build and start containers (rebuilds images)
docker compose up -d --build

## Stop containers without removing them
docker compose stop

## Start previously stopped containers
docker compose start

## Restart running or stopped containers
docker compose restart

## Stop and remove containers, networks, and volumes created by docker-compose
docker compose down

## Stop and remove containers but keep named volumes
docker compose down --volumes

## View logs from containers (all)
docker compose logs

## View logs and follow in real time (like tail -f)
docker compose logs -f

## View logs from specific service
docker compose logs nginx

## Execute a command in a running container (e.g. bash shell)
docker compose exec <service_name> bash
	example: docker compose exec nginx bash

## Run a one-off command in a new container (no need to be running)
docker compose run --rm <service_name> <command>
	example: docker compose run --rm nginx nginx -v

## List volumes created by Docker Compose (via Docker)
docker volume ls

## Remove unused Docker volumes (be careful)
docker volume prune

## List Docker networks (Docker Compose uses its own)
docker network ls

# NGINX

## Test Network Access (Must Work)
curl -I -v --tlsv1.2 --tls-max 1.2 https://jqueijo-.42.fr
curl -I -v --tlsv1.3 --tls-max 1.3 https://jqueijo-.42.fr

## Test Network Access (Must Fail)
curl -I -v --tlsv1 --tls-max 1.0 https://jqueijo-.42.fr
curl -I -v --tlsv1.1 --tls-max 1.1 https://jqueijo-.42.fr
