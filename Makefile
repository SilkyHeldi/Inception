
all: 
	docker-compose -f srcs/docker-compose.yml up -d 

info:
	@docker image ls -a && echo
	@docker container ls -a && echo
	@docker network ls && echo
	@docker volume ls && echo

clean:
	docker-compose -f srcs/docker-compose.yml down
fclean: clean
	@sudo rm -rf /home/llepiney/data/mariadb/*
	@sudo rm -rf /home/llepiney/data/wordpress/*
	@docker system prune -af

re: fclean all
