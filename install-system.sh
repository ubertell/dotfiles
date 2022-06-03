#!/bin/bash

sudo xbps-install -Sy  void-repo-nonefree
sudo xbps-install -Sy  iwd openntpd 
sudo xbps-install -Suy intel-ucode sof-firmware
sudo xbps-install -Suy mesa-dri
sudo xbps-install -Suy elogind dbus-elogind polkit
sudo xbps-install -Suy xorg-fonts
sudo xbps-install -Suy sway swaybg swaylock
sudo xbps-install -Suy git curl
sudo xbps-install -Suy kitty alacritty
sudo xbps-install -Suy unzip zip
sudo xbps-install -Suy pipewire
sudo xbps-install -Suy tree
sudo xbps-install -Suy podman
sudo xbps-install -Suy brightnessctl
sudo xbps-install -Suy neovim
sudo xbps-install -Suy awk sed
sudo xbps-install -Suy the_silver_searcher
sudo xbps-install -Suy elixir erlang-wx
sudo xbps-install -Suy base-devel
sudo xbps-install -Suy wl-clipboard
sudo xbps-install -Suy inotify-tools
sudo xbps-install -Suy xdg-utils
sudo xbps-install -Suy lshw
sudo xbps-install -Suy perl-rename
sudo xbps-install -Suy pup
sudo xbps-install -Suy bat
sudo xbps-install -Suy postgresql14 postgresql14-client postgresql14-contrib postgresql14-do
