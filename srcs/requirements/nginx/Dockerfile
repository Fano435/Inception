
FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl /data/www
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jrasamim.42.fr/UID=jrasamim"

COPY index.html /data/www

# RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
RUN chown -R www-data:www-data /data/www
RUN chmod 755 /data/www

# RUN chown -R www-data:www-data /var/www/html
# RUN chmod 755 /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]