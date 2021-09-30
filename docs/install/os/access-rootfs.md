---
layout: default
title: Accessing the RootFS Partition
grand_parent: Installation
parent: Raspberry Pi OS
nav_order: 5
permalink: /install/os/access-rootfs
---

# Accessing the RootFS partition

Some settings require you to access the `rootfs` partition on the SD Card. Unfortunately, most system's aren't able to do this. 

On Mac OS, the best solution I have found is [extFS for Mac][extFSParagon], which has a free trial. Paragon do make a version for Windows, however it is classed as business software instead of being for home users, and requires you to contact them for pricing.

Linux machine's (Including another Raspberry Pi, if you are setting up multiple LX Monitors) have the drivers available to access the partition.

Alternatively, you can boot the Raspberry Pi up with a monitor and keyboard attached and set these settings from the Pi it's self before connecting to the networks.

[extFSParagon]: https://www.paragon-software.com/home/extfs-mac/ "extFS for Mac by Paragon"