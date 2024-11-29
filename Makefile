all :
	mkdir -p /home/aaamam/data/db
	mkdir -p /home/aaamam/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build 

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	docker system prune -a -f
	sudo rm -rf /home/aaamam/data/wordpress/ /home/aaamam/data/db/
