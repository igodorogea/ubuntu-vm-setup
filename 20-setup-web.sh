#!/usr/bin/env bash

# 1. Install nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

# 1.1. Fix npm permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile
source ~/.profile

# 1.2. Install frontend npm packages
npm i -g npm @angular/cli gulp

# 2. Install IDE’s
# 2.1. Install Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

# 2.1.1. Configure Sublime
wget https://packagecontrol.io/Package%20Control.sublime-package -O "$HOME/.config/sublime-text-3/Installed\ Packages/Package Control.sublime-package"
# make sure submodules are cloned
git submodule init
git submodule update
# don't promt for confirmation when overwrite
rsync -vr --exclude="README.md" --exclude=".git" sublime-configs/ ~/.config/sublime-text-3/Packages/User/

# install fonts
rsync -vr fonts/ ~/.fonts/
sudo fc-cache -f -v
