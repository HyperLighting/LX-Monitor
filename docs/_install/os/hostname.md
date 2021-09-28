---
layout: default
title: Set your Hostname
grand_parent: Installation
parent: Raspberry Pi OS
nav_order: 7
permalink: /install/os/hostname
---
# Set your hostname

In most enterprise IT Networks, having a meaningful hostname is important. If you are only going to be running one LX Monitor, you could set the hostname to `LX-Monitor`, but if you are going to be running more, for example in your main stage, studio and rehearsal room, you could instead do `LX-Monitor-Main`, `LX-Monitor-Studio` and `LX-Monitor-Rehearsal`. Your IT Department may also have a standard they want you to follow.

Once you have chosen a hostname you can set it from the `rootfs` partition as follows:

1) Open the file `/etc/hostname` in Notepad or your terminal editor
2) Change the contents to your hostname & save
3) Open the file `/etc/hosts` in Notepad or your terminal editor
4) Add the following to the end of the file:

```
127.0.0.1   YOURHOSTNAME
```