#!/bin/bash

#sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
#chown -R www-data:www-data /var/www/*;
#chown -R 755 /var/www/*;
#mkdir -p /run/php/;
#touch /run/php/php7.3-fpm.pid;


if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up..."
	cd /var/www/html;
	wp core download --allow-root;
	echo "Move wp-config"
	mv /var/www/html/tools/wp-config.php /var/www/html/

	echo "Wordpress: creating users..."
	#wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
	wp user create --allow-root ${WP_USR} ${WP_EMAIL} --user_pass=${WP_PWD};
	#wp theme install --allow-root /var/www/html/tools/tronar.zip --activate
	wp config set WP_DEBUG true --allow-root
	wp config set WP_DEBUG_LOG true --allow-root
fi

/usr/sbin/php-fpm7.3 -F