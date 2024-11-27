all :
	mkdir -p /home/aaamam/data/db
	mkdir -p /home/aaamam/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d --build 

fclean:
	-docker stop $$(docker ps -aq)
	-docker rm $$(docker ps -aq)
	-docker rmi $$(docker images -aq)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q) 2> /dev/null
	-docker system prune -af --volumes y
	sudo rm -rf /home/aaamam/data/wordpress/ /home/aaamam/data/db/