FROM alpine:3.21

RUN apk update && apk upgrade --no-interactive

RUN apk add --no-cache wget php php-fpm

COPY ./tools/entrypoint.sh /usr/sbin/
RUN chmod 755 /usr/sbin/entrypoint.sh

ENTRYPOINT  [ "ash", "/usr/sbin/entrypoint.sh" ]
