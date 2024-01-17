all:
        @if [ -d "./data/db" ]; then \
                echo "MariaDB Directory exist"; \
        else \
                echo "Create MariaDB Directory"; \
                mkdir -p "./data/db"; \
        fi
        @if [ -d "./data/wp" ]; then \
                echo "Wordpress Directory exist"; \
        else \
                echo "Create Wordpress Directory"; \
                mkdir -p "./data/wp"; \
        fi

        @docker compose -f ./srcs/docker-compose.yml up -d --build

down:
        @docker compose -f ./srcs/docker-compose.yml down

re:
        @docker compose -f srcs/docker-compose.yml up -d --build

clean:
        @docker stop $$(docker ps -qa);\
        docker rm $$(docker ps -qa);\
        docker rmi -f $$(docker images -qa);\
        docker volume rm $$(docker volume ls -q);\
        docker network rm $$(docker network ls -q) 2>/dev/null;\
        rm -rf /home/jyim/data/wp;\
        rm -rf /home/jyim/data/db;\

.PHONY: all re down clean