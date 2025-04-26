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
 - Bluetooth = Yes (But the sound quality is not good)
 - Power Management = Yes
 - Suspend/resume - Yes (But auto wake with Lid open feature has to disable)

Tested on:
- kernel: 6.10.4-arch2-1 to 6.12.7-arch1-1(mainline), 6.6.70-1-lts (lts)
- distro: Arch linux, EndeavourOS, Opensuse tumbleweed
- WMs: i3, sway and Hyprland

## Manual Install

1. Add **disable-wakeup.service** as a systemd service to disable XHC1 (which is responsible for USB wakeups) LID0 (responsible for lid based wakeups). This workaround fixes the macbook immedaitely waking up when suspended.
2. Install iwd package from your package repository.

```bash
# For Arch Linux
sudo pacman -S iwd
```

5. Copy **wifi_backend.conf** to **/etc/NetworkManager/conf.d/** to make iwd as the wifi backend for NetworkManager.
4. Install **mpbfan** and **tlp** from your distro's package repositories.
5. Copy **mpbfan.conf** to **/etc/** to get my custom fan speed thresholds.
6. Copy **tlp.conf** to **/etc/** to get my custom cpu frequency thresholds.

Optional:

1. The UDEV rule files are from an arch linux thread to fix battery drain from disabling cardreader and bluetooth. Use them if needed.

> [!NOTE]
> You also need the remove_ignore_usb_device.sh in order to get UDEV files working.
> More info can be found in this arch linux thread - [https://wiki.archlinux.org/title/User:Elinux/MacBook_Pro_12,1#Powersave](https://wiki.archlinux.org/title/User:Elinux/MacBook_Pro_12,1#Powersave)

## Package Installers

An AUR package is available for Arch Linux users.

```bash
yay -S macbook-12-1-linux-fixes
```
> [!IMPORTANT]
> Don't forget to follow the instructions displayed after the installation.

## Some extra Tips

> [!TIP]
> 1. To get HW acceleration enabled for h264 videos. You can run `sudo pacman -S intel_media_driver` and add `LIBVA_DRIVER_NAME=iHD` to your shell configuration file. (ie - .zshrc for zsh).
*Hardware Acceleration in many chromium based browsers give occasional gltiches.*
(Workaround: Use Vivaldi browser)
> 2. For Youtube HW acceleration and to fix batttery drain issues you should disable AV1 and VP9 codecs in the browser, you can use `enhanced-h264ify` browser exrtension.
> 3. If you need a quick setup, use my dotfiles from [this repo.](https://github.com/Chamal1120/dotfiles-linux-hyprland/tree/main)

## Contributing

This is an open source project licensed under **MIT**. Started this coz I don't want anyone else to go through the same hell that I went. So any **contribution to make this even better at least a little bit is always welcome**.

## Thank You

Huge thank to all the contributors of the softwares that I have used here and all the people who posted and answered the questions in reddit threads, arch wiki, stack overflow and stack exchange.

If you think this was helpful to you please star the repo and share so others can discover too.
