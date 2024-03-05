#!/bin/bash
sleep 10

# Download the latest WordPress files
wp core download --allow-root
wp cli update
wp core update

#core config to modifiy wp-config.php if it already exists
wp core config	--dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --allow-root
wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS >> /log.txt

chown -R www-data:www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress

/usr/sbin/php-fpm7.3 -F
