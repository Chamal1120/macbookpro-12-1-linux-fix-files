<div align="center">

# MacBook 12,1 Linux Fixes
![AUR Version](https://img.shields.io/aur/version/macbook-12-1-linux-fixes?style=for-the-badge&logo=archlinux&logoColor=ffffff)
![AUR Maintainer](https://img.shields.io/aur/maintainer/macbook-12-1-linux-fixes?style=for-the-badge&logo=retroarch&logoColor=ffffff&color=%23eba0ac)
![GitHub License](https://img.shields.io/github/license/Chamal1120/macbookpro-12-1-linux-fix-files?style=for-the-badge&logo=google%20docs&logoColor=ffffff)

These are the fix files that I have found during my journey to make my mbp works as smoothly as possible on linux.

</div>

## What works?
 - Video = Yes
 - Sound = Yes
 - Ethernet = Yes
 - Wireless = Yes (with IWD as the backend for NetworkManager)
 - Bluetooth = Yes
 - Power Management = Yes
 - Suspend/resume - Yes (But auto wake with Lid feature has to go)

Tested on:
- kernel: from 6.10.4-arch2-1 to whatever the latest version as of now.
- distro: Arch linux

## Install

```bash
yay -S macbook-12-1-linux-fixes
```

## Manual Install

1. Install the dependancies:

```bash
sudo pacman -S iwd macfand tlp
```

1. Add **disable-wakeup.service** as a systemd service to disable XHC1 (which is responsible for USB wakeups) LID0 (responsible for lid based wakeups). This workaround fixes the macbook immedaitely waking up when suspended.
2. Copy **wifi_backend.conf** to **/etc/NetworkManager/conf.d/**.
3. Copy **macfand.conf** to **/etc/**.
4. Copy **tlp.conf** to **/etc/**.

Optional:
1. The UDEV rule files are from an arch linux thread to fix battery drain from disabling cardreader and bluetooth. Use them if needed. (I'll link the thread when I have some time again).

> [!NOTE]
> You also need the remove_ignore_usb_device.sh in order to get UDEV files working.
> More info can be found in this arch linux thread - [https://wiki.archlinux.org/title/User:Elinux/MacBook_Pro_12,1#Powersave](https://wiki.archlinux.org/title/User:Elinux/MacBook_Pro_12,1#Powersave)

## Some extra Tips

> [!TIP]
> 1. To get HW acceleration enabled for h264 videos. You can run `sudo pacman -S intel_media_driver` and add `LIBVA_DRIVER_NAME=iHD` to your shell configuration file. (ie - .zshrc for zsh).
> 2. For Youtube HW acceleration and to fix batttery drain issues you should disable AV1 and VP9 codecs in the browser, you can use `enhanced-h264ify` browser exrtension.
> 3. If you need a quick setup, use my dotfiles from [this repo.](https://github.com/Chamal1120/dotfiles-linux-hyprland/tree/main)

## License
This project is licensed under MIT License.
