## Linux fixes for the apple macbook pro 2015 13 inch (12,1)

These are the fix files that I have found during my journey to make my mbp works as smoothly as possible on linux.

- Tested linux kernel: 6.10.4-arch2-1 to 6.12.7-arch1-1
- Tested linux distro: Arch linux, EndeavourOS, Opensuse tumbleweed
- Tested WMs: i3, sway and Hyprland

### Manual Install

1. Add **disable-wakeup.service** as a systemd service to disable XHC1 (which is responsible for USB wakeups) LID0 (responsible for lid based wakeups). This workaround fixes the macbook immedaitely waking up when suspended.
2. Copy **wif_rand_mac.conf** to /etc/NetworkManager/conf.d/wifi_rand_mac.conf to disable mac randomization.
3. Install **wpa_suppplicant 2:2.10-8** package which is the last known version that works with the wifi-driver. (Please make sure you ignore upgrades for this package using your package manager config).
4. Install **mpbfan** and **tlp** from your distro's package repositories.
5. Copy **mpbfan.conf** to /etc/ to get my fan speed thresholds.
6. Copy **tlp.conf** to /etc/ to get my custom cpu frequency thresholds.
7. The UDEV rule files are from an arch linux thread to fix battery drain from disabling cardreader and bluetooth. Use them if you need.
_Note - **You also need the remove_ignore_usb_device.sh in order to get UDEV files working.**_

### Package Installers

As of now AUR package exists for Arch Users.

```bash
yay -S macbook-12-1-linux-fixes
```
NOTE: Don't forget to follow the instructions displayed after the installation.

### Some extra tips

1. To get HW acceleration enabled for h264 videos. You can run `sudo pacman -S intel_media_driver` and add `LIBVA_DRIVER_NAME=iHD` to your shell configuration file. (ie - .zshrc for zsh).
*Hardware Acceleration in chrome gives occasional gltiches.*
2. For Youtube HW acceleration and to fix batttery drain issues you should disable AV1 and VP9 codecs in the browser. You can use `enhanced-h264ify` browser extension for this .(firefox or a fork of firefox is always preffered)
3. If you need a quick setup use my dotfiles from this repo from this repo.

### Thank You
