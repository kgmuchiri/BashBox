# Android DBloater

A script application to debloat your Android Device

Sometimes android devices come with some bloat. While some applications can be hidden, I think it's better to have the option of uninstaling the OEM applications, but by default the most you can do is disable or hide them.

This is where DBloater comes in.

Using ADB, this script takes a list of all the packages in the packages.sh file and removes them from your device.

## How To Use

### Pre-requisite

1. A computer runing Linux or MacOS
2. Android Debug Bridge (ADB) is configured.
    - ADB installation guide [here](https://www.xda-developers.com/install-adb-windows-macos-linux/)
    - ADB package website [here](https://developer.android.com/tools/releases/platform-tools)


Once ADB is up and running do the following:

To add your packages, go to package.sh and add to the arrays already there or create your own array with the following namescheme:
    
    PKG_YOURARRAYNAME

The script will not recognise the array name if you do not follow it.

Once that's complete all you need to do is make sure that the run.sh file can execute with the following command:

    chmod +x ./run.sh

To execute just enter this command:

    ./run.sh


