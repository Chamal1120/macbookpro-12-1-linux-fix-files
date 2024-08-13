# Linux fixes for the apple macbook pro 2015 13 inch (12,1)

These are the fix files and fixes that I have found and created during my journey to make my mbp works as smoothly as possible on linux.

- Tested linux kernel: 6.10.4-arch2-1
- Tested linux distro: Arch linux
- Tested WMs: i3 (with picom compositor) and Hyprland

# How use the fix files

1. The two .service files are systemd unit files to limit the cpufreq to 2.6GHz and turn off turbo boost if enabled.
2. mpbfan.conf is the config file for the fan temp thresholds.
3. wpa_suppplicant file is the last known version that works with WiFi.
