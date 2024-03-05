#!/bin/bash
sleep 10

# Download the latest WordPress files
wp core download --allow-root --path=/var/www/wordpress
wp cli update
wp core update



wp config create	--dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress' --allow-root
wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

chmod 766 /var/www/wordpress/wp-config.php
chmod 766 /var/www/wordpress/.htaccess
chmod -R 766 /var/www/wordpress/wp-content/uploads

chown -R www-data:www-data /var/www/wordpress/wp-content/uploads
chown www-data:www-data /var/www/wordpress/wp-config.php
chown -R www-data:www-data /var/www/wordpress/.htaccess

/usr/sbin/php-fpm7.3 -F
