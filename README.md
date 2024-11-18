# Linux fixes for the apple macbook pro 2015 13 inch (12,1)

These are the fix files that I have found during my journey to make my mbp works as smoothly as possible on linux.

- Tested linux kernel: 6.10.4-arch2-1 to 6.11.7-arch-1
- Tested linux distro: Arch linux, EndeavourOS
- Tested WMs: i3 (with picom compositor), sway with wl-roots and Hyprland

# How use the fix files

1. **disable-wakeup.service** will disable XHC1 (which is responsible for USB wakeups). This workaround fixes the macbook immedaitely waking up when suspended.
2. **wifi-reload.sh** is my custom script to disable wifi when device suspends that also helps to fix suspend issues and get wifi working after waking up. The script disables on suspend and enables on wakeup.
3. **mpbfan.conf** is the config file for the fan temp thresholds.
4. **tlp.conf** has my custom cpu thresholds. (I turned turbo boost off here).
5. **wpa_suppplicant** file is the last known version that works with the WiFi driver.

```bash
pacman -U <package-name> # Install it using this commmand
```

6. The UDEV rule files are from a arch linux thread to fix battery drain from disabling cardreader and bluetooth. Use them if you need.
*You also need the remove_ignore_usb_device.sh in order to get UDEV files working.*

# Automaitc Install

A script is WIP.

# Some extra tips

1. To get HW acceleration enabled for h264 videos. You can run `sudo pacman -S intel_media_driver` and add `LIBVA_DRIVER_NAME=iHD` to your shell configuration file. (ie - .zshrc for zsh).
*Hardware Acceleration in chrome gives occasional gltiches.*
2. For Youtube HW acceleration and to fix batttery drain issues you should disable AV1 and VP9 codecs in the browser. You can use `enhanced-h264ify` browser extension for this .(firefox or a fork of firefox is always preffered)
3. If you need a quick setup use my dotfiles from this repo from this repo.

# Thank You
