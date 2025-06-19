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

echo "Found Packages: $array_names"
# Loop through each array and uninstall packages
for array in $array_names; do
    if declare -p "$array" 2>/dev/null | grep -q '^declare -a'; then
        echo -e "\n📁 Group: $array"
        eval "packages=(\"\${$array[@]}\")"

        for pkg in "${packages[@]}"; do
            if echo "$installed_packages" | grep -Fxq "$pkg"; then
                echo -n "  📦 Uninstalling: $pkg ... "
                output=$(adb shell pm uninstall --user 0 "$pkg" 2>&1)
                if echo "$output" | grep -q "Success"; then
                    echo "✅ Success"
                else
                    echo "❌ Failed - $output"
                fi
            else
                echo "  ⚠️  Skipped: $pkg not installed"
            fi
        done
    fi
done

echo "All packages processed."
echo "Finished uninstalling selected packages."
echo "Your device has been debloated!✅"
