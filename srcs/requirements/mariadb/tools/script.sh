#!/bin/sh


#/etc/init.d/mysql start
service mysql start


if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
        echo "Database already exists"
else
#First, you’re asked about the validate password plugin, a plugin that can automatically enforce certain password strength rules for your MySQL users.
#Enabling this is a decision you’ll need to make based on your individual security needs. Write y and press ENTER to enable it, or press ENTER to skip it.
#If enabled, you will also be prompted to choose a level from 0–2 for how strict the password validation will be. Choose a number and press ENTER to continue.

#Next you’ll be asked if you want to change the root password.
#If you recently created the password when you installed MySQL, you can safely skip this.
#Press ENTER to continue without updating the password.
#Or press Y, insert and confirm password.

#You will be asked about removing anonymous MySQL users, disallowing remote root logins, removing the test database, and
#reloading privilege tables to ensure the previous changes take effect properly.

#mysql_secure_installation << _EOF_
#Y
#jyim1234
#jyim1234
#Y
#n
#Y
#Y
#_EOF_

echo "CREATE WORDPRESS DATABASE";
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

fi

service mysql stop

exec "$@"