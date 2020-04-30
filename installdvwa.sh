# Custom Script for Linux
#!/bin/bash
sudo wget https://github.com/deltadan/dvwa/raw/master/dvwa1.zip
sudo wget https://github.com/deltadan/dvwa/raw/master/dvwa2.zip
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password p@ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password p@ssw0rd'
sudo apt-get install -y apache2 mysql-server php php-mysqli php-gd libapache2-mod-php unzip
sudo rm /var/www/html/index.html
mkdir /var/www/html/dvwa2
sudo mv dvwa1.zip /var/www/html/dvwa2
sudo unzip /var/www/html/dvwa2/dvwa1.zip -d /var/www/html/dvwa2/
sudo chmod -R 777 /var/www/html/dvwa2/hackable/uploads/
sudo apache2ctl restart