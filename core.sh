#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root"
  exit
fi

# update system before install
apt update -y
apt upgrade -y

# get core tools, languages, and libraries
apt install -y build-essential software-properties-common wget dirmngr curl \
  cmake git git-email lsof m4 apt-transport-https ca-certificates autoconf
apt install -y python-setuptools ruby ruby-dev texinfo xclip
apt install -y libzmq3 libzmq3-dev libczmq-dev libncurses-dev libncurses5-dev \
  libcurl4-openssl-dev libcurl4-gnutls-dev
apt install -y libbz2-dev libssl-dev libpng-dev liblzma-dev libpcre2-dev \
  libfreetype6-dev libsqlite3-dev libblas-dev liblapack-dev libreadline-dev \
  libboost-all-dev libfontconfig1-dev
apt install -y libexpat-dev libsdl-dev libxml2-dev libgeos-dev zlib1g-dev \
  libgdbm-dev libxslt1-dev libcairo-dev libgdal-dev libglib2.0-dev libtool

# TLP: optimization of Linux laptop battery life
add-apt-repository -y ppa:linrunner/tlp
apt install -y tlp tlp-rdw acpi-call-dkms

# ssh-askpass and keychain for ssh-agent
apt install -y ssh-askpass keychain

# GPG2 for signing git commits
apt install -y gnupg2

# utility for building/checking PDFs
apt install -y qpdf

# silver searcher and recursive grep
apt install -y silversearcher-ag ripgrep

# vim, the only editor
apt install -y vim

# system monitoring and system specs
apt install -y htop neofetch

# tmux
apt install -y tmux

# zsh and the z-plug manager
apt install -y zsh
curl -sL --proto-redir -all,https \
  https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
