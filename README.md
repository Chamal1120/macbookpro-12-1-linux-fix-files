<div align="center">

# MacBook 12,1 Linux Fixes
![AUR Version](https://img.shields.io/aur/version/macbook-12-1-linux-fixes?style=for-the-badge&logo=archlinux&logoColor=ffffff)
![AUR Maintainer](https://img.shields.io/aur/maintainer/macbook-12-1-linux-fixes?style=for-the-badge&logo=retroarch&logoColor=ffffff&color=%23eba0ac)
![GitHub License](https://img.shields.io/github/license/Chamal1120/macbookpro-12-1-linux-fix-files?style=for-the-badge&logo=google%20docs&logoColor=ffffff)

*Hassle free linux on macbook 2015 pro 13 inch*

</div>

> [!WARNING]
> I no longer maintain this repo as I lost my beloved MBP 12,1. Please go to [this](https://github.com/lakotamm/Macbook_Pro_Early_2015_A1502_Linux_Fedora) repo to get the most up to date fixes.

## What works?
 - Video = Yes
 - Sound = Yes
 - Ethernet = Yes
 - Wireless = Yes (with IWD as the backend for NetworkManager)
 - Bluetooth = Yes
 - Power Management = Yes
 - Suspend/resume - Yes (But auto wake with Lid feature has to go)
 - And everything else (This is my main linux box)

Tested on:
- kernel: from 6.10.4-arch2-1.
- distro: Arch linux

## Latest changes
 - I replaced mpbfan with an older project called macfand which gives better control.
 - Added thermald package (much better thermal management now!).
 - Minor tweaks in tlp config (CPU is downclocked to 2.7GHz).\
 - Latest Chrome now works with 0 issues.
 - Bluetooth gives no issues.


## Manual Install
1. Install the dependancies:
```bash
yay -S iwd tlp thermald macfand-git
```

2. Clone the repo:
```bash
git clone <>
cd
```

3. Add disable-wakeup systemd service:
```bash
cp init_services/disable-wakeup.service /usr/lib/systemd/system

sudo systemctl enable disable-wakeup.service
sudo systemctl start disable-wakeup.service
```

4. Copy configs:
```bash
cp configs/wifi_backend.conf /etc/NetworkManager/conf.d && cp configs/macfand.conf configs/tlp.conf /etc
```

5. Restart NetworkManager and tlp services:
```bash
sudo systemctl restart NetworkManager && sudo systemctl restart macfand && sudo systemctl restart tlp
```

## Automatic Install  (I have not tested this properly yet. But should work)
```bash
yay -S macbook-12-1-linux-fixes
```

Optional:
1. The UDEV rule files are from an arch linux thread to fix battery drain from disabling cardreader and bluetooth. Use them if needed. I don't see significant improvement with them. (I'll link the thread when I have some time again).

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

