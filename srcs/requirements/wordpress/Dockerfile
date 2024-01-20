FROM debian:buster

RUN apt-get -y update && apt-get install -y wget php php-mysql php-fpm

# Install WP-CLI and check if installed, enable type just wp instead of php wp-cli.phar
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
Run chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#RUN wp --info

# Create directory
RUN echo "Create /var/www/html/"
RUN mkdir -p /var/www/html/
RUN mkdir /run/php && mkdir /usr/log && touch /usr/log/www.access.log

EXPOSE 9000

#WORKDIR /var/www/html
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's/;access.log = log\/$pool.access.log/access.log = log\/$pool.access.log/g' /etc/php/7.3/fpm/pool.d/www.conf

# Create directory
#RUN echo "Create /var/www/html/"
#RUN mkdir -p /var/www/html/
#RUN mkdir /run/php && mkdir /usr/log && touch /usr/log/www.access.log

# Copy tools to container
RUN echo "Create tools folder and copy script and config"
RUN mkdir /var/www/html/tools
COPY ./conf /var/www/html/tools
COPY ./tools  /var/www/html/tools

#Download theme
#RUN wget https://public-api.wordpress.com/rest/v1/themes/download/tronar.zip
#RUN chmod +x tronar.zip
#RUN mv tronar.zip /var/www/html/tools

#RUN script
RUN chmod +x /var/www/html/tools/script.sh
RUN chmod 664 /var/www/html/tools/wp-config.php
CMD ["/var/www/html/tools/script.sh"]