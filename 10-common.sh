#!/usr/bin/env bash

# 0. update machine
sudo apt update
sudo apt upgrade -y
sudo apt-get autoclean
sudo apt-get autoremove

# 1. install basic packages
sudo apt install -y mc curl wget zsh git debconf-utils

# 2. install java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt install -y oracle-java8-installer

echo 'JAVA_HOME="/usr/lib/jvm/java-8-oracle"' | sudo tee -a /etc/environment > /dev/null
source /etc/environment

# install infinality fonts
sudo add-apt-repository -y ppa:no1wantdthisname/ppa
sudo apt update
sudo apt upgrade -y
sudo apt-get autoclean
sudo apt-get autoremove
sudo apt install -y fontconfig-infinality
echo '3' | sudo bash /etc/fonts/infinality/infctl.sh setstyle
