#!/bin/bash

# Copy this script to /usr/lib/systemd/systemd-sleep/
# Make sure it has executable permissions

LOGFILE="/var/log/wifi-reload.log"

echo "Wifi reload script triggered at $(date)" >> $LOGFILE

case "$1" in
  pre)
    echo "Disabling WiFi and unloading driver..." >> $LOGFILE
    nmcli radio wifi off
    sleep 2
    /usr/bin/rmmod brcmfmac_wcc brcmfmac
    echo "WiFi and driver unloaded." >> $LOGFILE
    ;;
  post)
    echo "Reloading driver and reconnecting WiFi..." >> $LOGFILE
    sleep 2
    /usr/bin/modprobe brcmfmac_wcc brcmfmac
    sleep 8
    nmcli radio wifi on
    nmcli device wifi rescan
    echo "WiFi reconnected." >> $LOGFILE
    ;;
esac

