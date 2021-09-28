---
layout: default
title: Enable SSH
grand_parent: Installation
parent: Raspberry Pi OS
nav_order: 2
permalink: /install/os/enable-ssh
---
# Enable SSH

SSH will be the primary way we interact with the Raspberry Pi as the Lite OS has no desktop environment, and the project is intended to be installed in a rack and left to do it's thing.

To enable SSH on a fresh install:

## Mac OS

1) Open the boot partition in your chosen Terminal:
```
cd /Volumes/boot
```

2) Create an empty file with no extension called `ssh`
```
touch ssh
```

## Windows

1) Open the boot partition in File Explorer
2) Create a new file by right clicking **New > Text Document** and entering the name ssh. Before creating ensure you delete the `.txt` extension.