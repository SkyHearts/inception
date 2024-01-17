#  nginx package from the official package repository using apt
FROM debian:buster

#RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
#       && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
#ENV LANG en_US.utf8

#  nginx and openssl  package from the official package repository using apt
RUN apt-get -y update
RUN apt-get -y install nginx openssl

# Create ssl folder and selfsign sig
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
 -out /etc/nginx/ssl/jyim.crt\
 -keyout /etc/nginx/ssl/jyim.key\
 -subj "/C=Ms/L=KL/O=42kl/OU=student/CN=jyim.42.kl"

# replace nginx configuration with custom configuration
#COPY ./conf/default /etc/nginx/sites-available/default
COPY ./conf/default /etc/nginx/conf.d/global.conf

# Expose port
EXPOSE 443

# Run script
#COPY ./tools/script.sh /
#CMD [ "/script.sh" ]

# Runs whenever docker image launches
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
