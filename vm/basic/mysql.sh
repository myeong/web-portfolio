#!/bin/bash

echo "- Installing MySQL"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt install -y mysql-server mysql-client --fix-broken --fix-missing > /dev/null 2>&1
sudo service mysql start > /dev/null 2>&1

# echo "- Installing PHPMYADMIN"
# sudo apt-get install -y phpmyadmin php-mbstring php-gettext > /dev/null 2>&1
# sudo phpenmod mcrypt
# sudo phpenmod mbstring
# sudo systemctl restart apache2
# sudo cp /vagrant/my.cnf /etc/mysql/my.cnf

#sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking &

# Allow MySQL connectivity from host 
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Bind MySQL to selected IP address 
#sudo sed -i 's/= 127.0.0.1/= 192.168.33.13/g' /etc/mysql/my.cnf
sudo service mysql restart > /dev/null 2>&1