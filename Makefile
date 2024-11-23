all : 
	docker compose -f ./srcs/docker-compose.yml up --build

fclean:
	-docker stop $$(docker ps -aq)
	-docker rm $$(docker ps -aq)
	-docker rmi $$(docker images -aq)
	-docker network rm $$(docker network ls -q) 2> /dev/null
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af --volumes y