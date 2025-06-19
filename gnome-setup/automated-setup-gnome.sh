!#/bin/bash

packages=(
    gnome-tweaks
    gnome-shell-extensions
    gnome-terminal
    nautilus
    inkscape
    vlc
)
for package in ${packages[@]}; do
    if ! dpkg -l | grep -q "^ii\s\+$package"; then
        echo "Installing $package..."
        sudo apt-get install -y "$package"
    else
        echo "$package is already installed."
    fi
done