FROM debian:buster

RUN apt-get update -y && apt-get install -y redis

EXPOSE 6379

COPY ./tools /
RUN chmod +x ./script.sh
ENTRYPOINT ["./script.sh"]

#CMD ["redis-cli", "CONFIG", "SET", "requirepass", "jyim1234"]
#CMD ["redis-server", "--protected-mode", "no"]