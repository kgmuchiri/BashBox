#!/bin/bash


set +e


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

#getting installed packages
echo "📦 Fetching list of installed packages..."
installed_packages=$(adb shell pm list packages | sed 's/^package://')

# Initialize counters
success_count=0
fail_count=0
skipped_count=0

# Get all array names defined in packages.sh
echo "Fetching package arrays from packages.sh ..."
array_names=$(compgen -A variable | grep '^PKG_')
echo "Found Packages: $array_names"

# Loop through each array and uninstall packages
for array in $array_names; do
    if declare -p "$array" 2>/dev/null | grep -q '^declare -a'; then
        echo -e "\n📁 Group: $array"
        eval "packages=(\"\${$array[@]}\")"

        for pkg in "${packages[@]}"; do
            if echo "$installed_packages" | grep -Fxq "$pkg"; then
                output=$(adb shell pm uninstall --user 0 "$pkg" 2>&1)
                if echo "$output" | grep -q "Success"; then
                    echo "  ✅ Uninstalled: $pkg"
                    ((success_count++))
                else
                    echo "  ❌ Failed: $pkg - $output"
                    ((fail_count++))
                fi
            else
                echo "  ⚠️  Skipped (not installed): $pkg"
                ((skipped_count++))
            fi
        done
    fi
done

echo -e "\n🧾 Summary:"
echo "  ✅ Success: $success_count"
echo "  ❌ Failed:  $fail_count"
echo "  ⚠️  Skipped: $skipped_count"

echo "\n✅ Finished processing packages."

echo "Finished uninstalling selected packages."
echo -e "\nYour device has been debloated!✅"
