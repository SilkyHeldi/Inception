FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN mkdir -p /run/php/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress

COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.3/fpm/pool.d/www.conf


COPY conf/WP-config.sh /usr/local/bin/WP-config.sh
RUN chmod 755 /usr/local/bin/WP-config.sh

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["bash", "/usr/local/bin/WP-config.sh"]

