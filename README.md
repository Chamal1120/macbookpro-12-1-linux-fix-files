# Linux fixes for the apple macbook pro 2015 13 inch (12,1)

These are the fix files and fixes that I have found and created during my journey to make my mbp works as smoothly as possible on linux.

- Tested linux kernel: 6.10.4-arch2-1 and 6.6 LTS
- Tested linux distro: Arch linux, EndeavourOS
- Tested WMs: i3 (with picom compositor), sway with wl-roots and Hyprland

# How use the fix files

1. `cpupower.service is a systemd unit file which will limit the cpu frequency to 2.6GHz as the current kernel doesn't allow to disable turbo boost for this macbok's processor.
2. `disable-wakeup.service will disable XHC1 (which is responsible for USB wakeups) and LID0 (which is responsible for lid wakeup). This workaround fixes the macbook immedaitely waking up when suspended.
3. mpbfan.conf is the config file for the fan temp thresholds.
4. wpa_suppplicant file is the last known version that works with WiFi. This can be easily installed on arch using `pacman -U <package-name>`. If you're on a different distro search for the exact wpa_supplicant version that I have put here in your package repositories.


# Some extra tips

1. To get HW acceleration enabled for h264 videos. You can run `sudo pacman -S intel_media_driver` and add `LIBVA_DRIVER_NAME=iHD` to your shell configuration file. (ie - .zshrc for zsh).
1. For Youtube playback batttery drain issues you should disable AV1 and VP9 codecs in the browser. You can use `enhanced-h264ify` browser extension for this .(firefox or a fork of firefox is always preffered)
2. If you have docker issues I have a github gist explainning how install docker on arch linux right here.
3. If you need a quick setup use my dotfiles from this repo from this repo.
