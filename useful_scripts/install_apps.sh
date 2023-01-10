#!/bin/bash

set -o pipefail
set -e
set -u

### Install yadm
sudo apt-get -y install \
	yadm \

### Clone dotfiles
yadm clone https://github.com/TracyRage/dotfile_centre.git

sudo apt-get -y install \
	vim \
	zathura \
	newsboat \
	tmux 

### Install tl;dr
sudo apt install python3-pip
pip3 install tldr
pip3 install subliminal

### Install flatpak
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install flatpak 
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### 

# Spotify
flatpak install flathub com.spotify.Client

# Libre Office
flatpak install flathub org.libreoffice.LibreOffice

# GIMP
flatpak install flathub org.gimp.GIMP

# Inkscape
flatpak install flathub org.inkscape.Inkscape

# Telegram
flatpak install flathub org.telegram.desktop

# Install R


# Conda
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh

bash Anaconda-latest-Linux-x86_64.sh

echo "Done!"
echo "Check tmux / vim / newboat config"
echo "Install RStudio, 1Password and mpv"
