#!/bin/bash

#exit on error
set -e


print_logo() {
    cat << "EOF"
    ____  ____  _             _            
    |  _ \| __ )| | ___   __ _| |_ ___ _ __ 
    | | | |  _ \| |/ _ \ / _\` | __/ _ \ '__|    ADB Debloater
    | |_| | |_) | | (_) | (_| | ||  __/ |       kgmuchiri
    |____/|____/|_|\___/ \__,_|\__\___|_|  

EOF
}

print_logo


# Load categorized package lists
source ./apk-bloat.sh

# Check ADB
if ! command -v adb &> /dev/null; then
    echo "ADB not installed."
    exit 1
fi

# Check device connection
if ! adb get-state 1>/dev/null 2>&1; then
    echo "No device connected."
    exit 1
fi

echo "✅ Device connected."

# Combine desired groups here
ALL_PACKAGES=(
   com.facebook.appmanager
)

# Uninstall loop
for pkg in "${ALL_PACKAGES[@]}"; do
    echo "📦 Uninstalling $pkg ..."
    adb shell pm uninstall --user 0 "$pkg"
done

echo "✅ Finished uninstalling selected packages."
