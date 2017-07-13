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
sudo apt -y install vim htop pcregrep unzip siege curl
# ************************************************************ #

# *************** Installs Apache2 HTTP Server *************** #
sudo apt -y install apache2
# ************************************************************ #

# ********************** Installs PHP 7 ********************** #
sudo apt -y install php7.0 php7.0-cli php7.0-curl php7.0-json php7.0-xml \
    php7.0-mcrypt php7.0-mbstring php7.0-mysql php7.0-pgsql php7.0-intl
# ************************************************************ #
