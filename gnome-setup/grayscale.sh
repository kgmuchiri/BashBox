#!/bin/bash

set -e
# Script to enable or disable grayscale mode in GNOME desktop environment
SCHEMA="org.gnome.desktop.a11y.magnifier"

# Check for argument
if [ "$1" == "on" ]; then
    echo "Enabling grayscale mode..."
    gsettings set org.gnome.desktop.a11y.applications screen-magnifier-enabled true
    gsettings set $SCHEMA color-saturation 0.0

elif [ "$1" == "off" ]; then
    echo "Disabling grayscale mode..."
    gsettings set $SCHEMA color-saturation 1.0
    gsettings set org.gnome.desktop.a11y.applications screen-magnifier-enabled false

else
    echo "Usage: $0 [on|off]"
    exit 1
fi
