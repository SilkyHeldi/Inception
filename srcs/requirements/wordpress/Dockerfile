FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt install vim -y
RUN apt install curl -y

RUN apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf latest-fr_FR.tar.gz && rm latest-fr_FR.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/WP-config.sh /WP-config.sh

ENTRYPOINT ["bash", "WP-config.sh"]

