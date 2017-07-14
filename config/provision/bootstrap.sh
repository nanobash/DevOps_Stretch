#!/usr/bin/env bash

# ************************************************************ #
# *        Maintains debian/stretch Operating System         * #
# ************************************************************ #

# ************************** Basics ************************** #
# Fixes broken dependencies
sudo apt -f install

# Removes unused packages
sudo apt -y autoremove

# Cleans repository cache
sudo apt clean all

# Update packages
sudo apt -y update

# Upgrade packages
sudo apt -y upgrade
# ************************************************************ #

# ***************** Installs Handy Utilities ***************** #
sudo apt -y install vim htop pcregrep unzip siege curl debconf-utils
# ************************************************************ #

# *************** Installs Apache2 HTTP Server *************** #
sudo apt -y install apache2
# ************************************************************ #

# ********************** Installs PHP 7 ********************** #
sudo apt -y install php7.0 php7.0-cli php7.0-curl php7.0-json php7.0-xml \
    php7.0-mcrypt php7.0-mbstring php7.0-mysql php7.0-pgsql php7.0-intl
# ************************************************************ #

# *************** Moves config files from /tmp *************** #
sudo mv /tmp/apache2.conf /etc/apache2/apache2.conf
sudo mv /tmp/html.conf /etc/apache2/sites-available/html.conf
sudo mv /tmp/silex.conf /etc/apache2/sites-available/silex.conf
sudo mv /tmp/symfony.conf /etc/apache2/sites-available/symfony.conf
sudo mv /tmp/yii.conf /etc/apache2/sites-available/yii.conf
sudo mv /tmp/pga.conf /etc/apache2/sites-available/pga.conf
# ************************************************************ #

# ***************** Configures Virtual Hosts ***************** #
# Disables default existing one
sudo a2dissite 000-default.conf

# Enables default html.conf virtual host
sudo a2ensite html.conf

# Enables symfony.conf virtual host
sudo a2ensite symfony.conf

# Enables silex.conf virtual host
sudo a2ensite silex.conf

#Enables yii.conf virtual host
sudo a2ensite yii.conf
# ************************************************************ #

# ********* Install PostgreSQL 9.6 && phpPgAdmin 5.1 ********* #
sudo apt -y install postgresql phppgadmin

# Creates database 'admin' with the user 'admin' using password of 'admin' and grants all the privileges to the database
sudo -u postgres psql -c "CREATE DATABASE admin ENCODING 'UTF8' LC_COLLATE='en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8'" 2> /dev/null;
sudo -u postgres psql -c "CREATE ROLE admin WITH LOGIN PASSWORD 'admin'" 2> /dev/null;
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE admin TO admin" 2> /dev/null;

# Disables phpPgAdmin config
sudo a2disconf phppgadmin

# Enables phpPgAdmin virtual host
sudo a2ensite pga.conf
# ************************************************************ #

# ********************* Restart Services ********************* #
sudo systemctl restart apache2.service
# ************************************************************ #
