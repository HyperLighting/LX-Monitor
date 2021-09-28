---
layout: default
title: Flash the SD Card
parent: Raspberry Pi OS
grand_parent: Installation
nav_order: 1
permalink: /install/os/sd-card
---

# Flashing the SD Card

The first step in the process is to install Raspberry Pi's base operating system onto an SD Card.

1. Download "Raspberry Pi OS Lite" from the [Raspberry Pi Foundation's website][RPIDownload]
2. Download the [Etcher][EtcherDownload] Tool
3. Using the Etcher tool, flash the Raspberry Pi image to your SD Card

This results in a clean install of Raspberry Pi OS on the SD Card. Before we boot up for the first time, there are a few things we can configure now to make things go a little bit smoother.

By default, the installation of the OS onto the SD has created two partitions. One called `boot`, and the other called `rootfs`. The `boot` partition is fairly easy to access, being a MS-DOS (FAT 32) partition. In here we will set a few settings related to the hardware and boot up of the Raspberry Pi. The `rootfs` partition can be a bit more challenging to access, especially on Mac OS as it is a extFS partition. All the settings in this partition can be altered from the Raspberry Pi once it has booted, but you may need an external monitor and keyboard to set these up before using network access.

[RPIDownload]: https://www.raspberrypi.org/software/operating-systems/ "Raspberry Pi Foundation"
[EtcherDownload]: https://www.balena.io/etcher/ "Etcher"