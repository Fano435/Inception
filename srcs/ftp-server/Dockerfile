FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install vsftpd ftp -y

# COPY .env /.env

COPY ftp_config.sh /
RUN chmod +x ftp_config.sh

EXPOSE 21 21000-21010

CMD ["bash", "/ftp_config.sh"]