#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root"
  exit
fi


# add notice about instructions for Docker on Ubuntu
echo "This script makes additions to Xfce based on recommendations from
      http://www.webupd8.org/2013/12/things-to-do-after-installing-ubuntu-on.html"


# add packages/software to make Xubuntu/Xfce look/feel more like Ubuntu/Unity
apt-get update
apt-get install ubuntu-restricted-extras
apt-get install ttf-ubuntu-font-family
apt-get install xubuntu-icon-theme


# add the Xfce "whisker" menu and related plug-ins
apt-get install xfce4-whiskermenu-plugin
apt-get install xfce4-indicator-plugin
apt-get install --no-install-recommends indicator-sound


# remove XScreensaver, since it causes problems on Chromebook
apt-get purge xscreensaver