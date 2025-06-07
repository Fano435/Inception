FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client
RUN apt-get install -y php7.4-redis redis-tools

COPY wp_config.sh /

RUN chmod +x wp_config.sh

ENTRYPOINT ["./wp_config.sh"]
