# Custom Script for Linux
#!/bin/bash
#set parameters for server installs
sudo apt-get install -y apache2 mysql-server php php-mysqli php-gd libapache2-mod-php unzip
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password p@ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password p@ssw0rd'
sudo rm /var/www/html/index.html
#install first dvwa instance
sudo wget https://github.com/deltadan/dvwa/raw/master/dvwa1.zip
mkdir /var/www/html/dvwa1
sudo mv dvwa1.zip /var/www/html/dvwa1
sudo unzip /var/www/html/dvwa1/dvwa1.zip -d /var/www/html/dvwa1/
sudo chmod -R 777 /var/www/html/dvwa1/hackable/uploads/
#install second first dvwa instance
sudo wget https://github.com/deltadan/dvwa/raw/master/dvwa2.zip
mkdir /var/www/html/dvwa2
sudo mv dvwa2.zip /var/www/html/dvwa2
sudo unzip /var/www/html/dvwa2/dvwa2.zip -d /var/www/html/dvwa2/
sudo chmod -R 777 /var/www/html/dvwa2/hackable/uploads/
# restart apache after installs
sudo apache2ctl restart