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
