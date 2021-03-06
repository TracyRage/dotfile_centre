#!/bin/bash

# Header
set -e
set -u
set -o pipefail

# Get OS name and version
OSNAME=$(awk -F= '/ID_LIKE/ {print $2}' /etc/os-release)
OSVERS=$(awk -F= '/UBUNTU_CODENAME/ {print $2}' /etc/os-release)

# Check for existing R and packages
dpkg -l | grep -E "(r-base-core|cran)"

# Remove existing R installation
sudo apt-get purge -y r-base-core

# Add keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9

# Add CRAN repo
sudo add-apt-repository "deb http://cran.rstudio.com/bin/linux/$OSNAME $OSVERS-cran40/"

# Update the package list
sudo apt-get -y update

# Install new R
sudo apt-get -y install r-base

# Install other staff
sudo apt-get -y install \
	htop \
	libcurl4-openssl-dev \
	libssl-dev \
	libgeos-dev \
	libgdal-dev \
	libproj-dev \
	libxml2-dev \
	libudunits2-dev \
	libsodium-dev \
	pandoc \
	openjdk-8-jdk \
	openjdk-8-jre \
	cargo \
	libcairo2-dev \
	libfreetype6-dev \
	libclang-dev \
	ttf-mscorefonts-installer \
	fonts-roboto
