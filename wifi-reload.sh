#!/bin/bash

# Copy this script to /usr/lib/systemd/system-sleep/wifi-reload.sh

case "$1" in
  pre)
    # Disconnect WiFi and unload driver before suspend
    nmcli radio wifi off         # Turns off WiFi via NetworkManager
    sleep 2                      # Short delay to ensure disconnection
    /usr/bin/rmmod brcmfmac
    ;;
  post)
    # Reload driver and reconnect WiFi on resume
    sleep 2
    /usr/bin/modprobe brcmfmac
    sleep 8                      # Longer delay to let the driver initialize
    nmcli radio wifi on          # Turns WiFi back on via NetworkManager
    nmcli device wifi rescan     # Forces a rescan of available networks
    ;;
esac

