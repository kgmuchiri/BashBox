#!/bin/bash

#exit on error
set -e


print_logo() {
    cat << "EOF"
     ____  ____  _             _            
    |  _ \| __ )| | ___   __ _| |_ ___ _ __ 
    | | | |  _ \| |/ _ \ / _\` | __/ _ \ '__|   An Android Debloating Tool
    | |_| | |_) | | (_) | (_| | ||  __/ |       By kgmuchiri
    |____/|____/|_|\___/ \__,_|\__\___|_|  

EOF
}

print_logo


# Load categorized package lists
source ./packages.sh

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


echo "Fetching package arrays from packages.sh ..."

# Get all array names defined in packages.sh
array_names=$(compgen -A variable | grep '^PKG_')

cat << array_names

# Loop through each array and uninstall packages
for array in $array_names; do
    echo "Group: $array"
    eval "packages=(\"\${$array[@]}\")"

    for pkg in "${packages[@]}"; do
        echo "  Uninstalling: $pkg"
        adb shell pm uninstall --user 0 "$pkg"
    done
done

echo "All packages processed."
echo "Finished uninstalling selected packages."
echo "Your device has been debloated!✅"
