#!/bin/bash

mkdir -p /var/run/vsftpd/empty

adduser $FTP_USER --disabled-password --gecos ""
echo "$FTP_USER:$FTP_PASS" | chpasswd
echo "$FTP_USER" >> /etc/vsftpd.userlist
echo "$FTP_USER"

mkdir -p /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
chmod 755 /home/$FTP_USER/ftp

sed -i 's/#write_enable=YES/write_enable=YES/' etc/vsftpd.conf
sed -i 's/#chroot_local_user/chroot_local_user/' etc/vsftpd.conf
sed -i 's/#anon_upload_enable=YES/anon_upload_enable=YES/' etc/vsftpd.conf
echo "userlist_file" | tee -a /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> etc/vsftpd.conf
echo "local_root=/home/$FTP_USER/ftp" >> etc/vsftpd.conf
echo "pasv_enable=YES" >> etc/vsftpd.conf
echo "pasv_min_port=21000" >> /etc/vsftpd.conf
echo "pasv_max_port=21010" >> /etc/vsftpd.conf

usermod -s /bin/false
/bin/false >> /etc/shells

service vsftpd stop
vsftpd /etc/vsftpd.conf
