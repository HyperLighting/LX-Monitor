---
layout: default
title: Disable WiFi & Bluetooth
grand_parent: Installation
parent: Raspberry Pi OS
nav_order: 4
permalink: /install/os/disable-bt-wifi
---

# Disable Bluetooth and WiFi

As we intend to use two wired network connections, we can disable Bluetooth and WiFi. If you need to use WiFi (For public Internet), skip the parts for that below.

1) Open the file `config.txt`, either in Notepad, or in your terminal with a tool such as nano.
2) At the bottom of the file, find the line:
```
# Additional overlays and parameters are documented /boot/overlays/README
```

Below this, add the following overlays to disable Bluetooth and WiFi on boot.

```
dtoverlay=disable-wifi
dtoverlay=disable-bt
```

The first line disables the onboard WiFi, the second line disables the onboard Bluetooth. Simply exclude a line if you still need that functionality.
