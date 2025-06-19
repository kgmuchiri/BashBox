#!/bin/bash

# This is a categorized list of packages to be removed from Android Devices.
# Comment and uncomment the desired groups in the run.sh script to select which packages to remove.

# Samsung Applications
PKG_SAMSUNG=(
    com.samsung.android.app.settings.bixby
    com.samsung.android.app.watchmanager
    com.samsung.android.app.contacts
    com.samsung.android.smartcallprovider
    com.samsung.android.app.watchmanagerstub
    com.samsung.android.messaging
    com.samsung.android.calendar
    com.samsung.android.themestore
    com.samsung.android.smartswitchassistant
    com.samsung.android.arzone
    com.samsung.android.stickercenter
    com.samsung.android.aremojieditor
    com.samsung.android.app.notes
    com.samsung.android.aremoji
    com.sec.android.mimage.avatarstickers
    com.samsung.android.kidsinstaller
    com.samsung.android.app.spage
    com.samsung.android.app.routines
    com.samsung.android.voc)

#Google Apps
PKG_GOOGLE_APPS=(
    com.google.android.apps.maps
    com.google.android.youtube
    com.google.android.gm
    com.google.android.apps.docs
    com.google.android.apps.maps
)

#Facebook
PKG_FACEBOOK=(
    com.facebook.appmanager
    com.facebook.system
    com.facebook.services

)

#Phone functionality applications
#PHONE-APPS=(
    #com.sec.phone
    #com.android.phone
    #com.samsung.android.app.contacts
    #com.samsung.android.providers.contacts
    #com.sec.android.widgetapp.easymodecontactswidget
#)

#netflix
PKG_NETFLIX=(com.netflix.partner.activation)

#onedrive
PKG_ONEDRIVE=(com.microsoft.skydrive)