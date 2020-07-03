#! /bin/bash
echo "Hi I am a robot, I will inst nginx"
sudo apt-get install update -y

#db_config
echo "name of you DB"
read db_name
echo "name of user for DB"
read db_user
echo "passw for user"
read db_pass

#Install Nginx
echo "Install Nginx" 
sudo apt-get install nginx -y
echo "Nginx installed"

sudo cp -R default /etc/nginx/sites-enabled/
sudo cp -R index.php /var/www/html/
echo "You config is added"

sudo nginx -t
echo  "Status of you config"

sudo systemctl enable nginx
sudo systemctl start nginx
echo "Your Nginx is WORKING!"

#Install PHP
sudo apt-get install php php-fpm php-mysql php-mysqli -y
echo "Installed PHP"

sudo systemctl enable php7.4-fpm
sudo systemctl start php7.4-fpm
echo "PHP WORKING"

sudo systemctl stop apache2
echo "Ill apache2 has stopped"

sudo systemctl restart php7.4-fpm
sudo systemctl restart nginx
#sudo systemctl status nginx
echo "Status of your NGINX"

sudo apt-get install mariadb-server mariadb-client -y
sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service
<<<<<<< HEAD
sudo mysql -u root << EOF
CREATE DATABASE $db_name;
CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass';
GRANT ALL ON $db_name.* TO '$db_user'@'localhost' WITH GRANT OPTION;
=======
sudo mysql -u root << EOF
CREATE DATABASE wpdb300;
CREATE USER 'wpdbuser300'@'localhost' IDENTIFIED BY '23mtk456';
GRANT ALL ON wpdb300.* TO 'wpdbuser300'@'localhost' WITH GRANT OPTION;
>>>>>>> 8762dea4b585a6f631814192bfc1eaffe5ac5b96
FLUSH PRIVILEGES;
EOF
echo "DB installed"

sudo cd /tmp
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo mv wordpress /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress/
sudo chmod -R 777 /var/www/wordpress
<<<<<<< HEAD
#sudo cp -R ~/wp-config-sample.php /var/www/wordpress/wp-config.php
=======
sudo cp -R wp-config-sample.php /var/www/wordpress/wp-config.php
>>>>>>> 8762dea4b585a6f631814192bfc1eaffe5ac5b96
sudo systemctl restart nginx.service
sudo systemctl restart php7.4-fpm

echo "Your site added"

sudo apt-get install apache2 libapache2-mod-php
sudo cp -R ports.conf /etc/apache2/ports.conf
sudo cp -R 000-default.conf /etc/apache2/sites-enabled/
sudo cp -R hosts /etc/hosts
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl restart nginx
sudo systemctl restart apache2



