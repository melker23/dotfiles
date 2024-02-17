#!/bin/bash

# Update system and install essential tools
sudo pacman -Syu
sudo pacman -S --noconfirm base-devel git

# Install AUR helper (yay)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo "Yay has been installed"

# Install penetration testing tools
yay -S --noconfirm wireshark-qt nmap nikto sqlmap metasploit aircrack-ng hydra john burpsuite gobuster dirbuster

# Set up BlackArch repository
curl -O https://blackarch.org/strap.sh
echo "26849980b35a42e6e192c6d9ed8c46f0d6d06047 strap.sh" | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
sudo pacman -Syu

echo "Penetration testing tools installed successfully."

sudo git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists

echo "Wordlists installed"

