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
pip3 install tldr

# Spotify
flatpak install flathub com.spotify.Client

# Libre Office
flatpak install flathub org.libreoffice.LibreOffice

# mpv
flatpak install flathub io.mpv.Mpv

# GIMP
flatpak install flathub org.gimp.GIMP

# Inkscape
flatpak install flathub org.inkscape.Inkscape

# Telegram
flatpak install flathub org.telegram.desktop

# Brave
flatpak install flathub com.brave.Browser

# Conda
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh

bash Anaconda-latest-Linux-x86_64.sh

echo "Done!"
echo "Check tmux / vim / newboat config"
echo "Install RStudio and 1Password"
