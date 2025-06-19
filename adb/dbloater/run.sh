#!/bin/bash

# Load categorized package lists
source ./apk-bloat.sh

# Check ADB
if ! command -v adb &> /dev/null; then
    echo "❌ ADB not installed."
    exit 1
fi

# Check device connection
if ! adb get-state 1>/dev/null 2>&1; then
    echo "❌ No device connected."
    exit 1
fi

echo "✅ Device connected."

# Combine desired groups here
ALL_PACKAGES=(

)

# Uninstall loop
for pkg in "${ALL_PACKAGES[@]}"; do
    echo "📦 Uninstalling $pkg ..."
    adb shell pm uninstall --user 0 "$pkg"
done

echo "✅ Finished uninstalling selected packages."
