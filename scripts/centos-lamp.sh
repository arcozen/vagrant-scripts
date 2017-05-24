#!/bin/bash

yum update -y --exclude=kerne

# install utility
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

# mount local www resources
rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP Install
yum install -y php php-cli php-common php-devel phph-mysql

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES;"

# Download Starter Content

service httpd restart