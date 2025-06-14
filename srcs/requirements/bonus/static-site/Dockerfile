FROM alpine:3.21

RUN apk add --no-cache tini busybox-extras

WORKDIR /var/www/

COPY ./public /var/www/

ENTRYPOINT ["/sbin/tini", "-g", "--"]

CMD ["httpd", "-f", "-h", "/var/www", "-p", "80"]

EXPOSE 80

