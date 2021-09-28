---
layout: default
title: Connect Via SSH
grand_parent: Installation
parent: Setup Base OS
nav_order: 2
permalink: /install/os-setup/ssh
---
# Connect via SSH to the Raspberry Pi

To connect to the Raspberry Pi we are going to use the SSH protocol.

If you are on Windows, I recommend [PuTTY][PuttyDownload] and [MTPuTTY][MTPuttyDownload] (MTPuTTY requires PuTTY to work).

If you are on Mac, the built in Terminal will work fine, if you are looking for a nicer experience, I recommend [Hyper][HyperDownload].

Using the IP Address details for your Pi, SSH into the Pi using the following credentials:

```
Username: pi
Password: raspberry
```

To do this on Mac or Linux, use the following command:

```
ssh pi@YOURIPADDRESS
```

On Windows in MTPuTTY, simply fill in the details in the GUI.

[PuttyDownload]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html "PuTTY SSH Client"
[MTPuttyDownload]: https://ttyplus.com/downloads/ "Multi Tabbed PuTTY"
[HyperDownload]: https://hyper.is/ "Hyper Terminal"