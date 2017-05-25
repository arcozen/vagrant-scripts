#!/bin/bash

yum update -y --exclude=kernel

# Install Utility

yum install -y nano git unzip screen wget

# Apache

yum install -y httpd httpd-devel httpd-tools

chkconfig --add httpd

chkconfig httpd on

service httpd stop

# Mount local www resources

rm -rf /var/www/html

ln -s /vagrant /var/www/html

service httpd start

# PHP Install

yum install -y php php-cli php-common php-devel php-mysql

# MySQL

yum install -y mysql mysql-server mysql-devel

chkconfig --add mysqld

chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES;"

# Download Starter Content

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/arcozen/vagrant-scripts/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/arcozen/vagrant-scripts/master/files/info.php

service httpd restart