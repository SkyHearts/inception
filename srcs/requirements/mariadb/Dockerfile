FROM debian:buster
# Intall and update
RUN apt-get update
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306


# Run script
COPY ./tools/script.sh /
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod +x /script.sh
#CMD [ "/script.sh" ]
ENTRYPOINT ["./script.sh"]

#CMD ["mysqld", "--bind-address=0.0.0.0"]
CMD ["mysqld"]