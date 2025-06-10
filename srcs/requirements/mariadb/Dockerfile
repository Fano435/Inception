FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server netcat

COPY ./tools/mdb-conf.sh /mdb-conf.sh
# COPY .env /.env

RUN chmod +x /mdb-conf.sh

ENTRYPOINT ["./mdb-conf.sh"]