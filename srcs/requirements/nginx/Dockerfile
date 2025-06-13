FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl /var/www/wordpress
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=*jrasamim.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod 755 /var/www/wordpress

CMD [ "nginx", "-g", "daemon off;" ]