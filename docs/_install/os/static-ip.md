---
layout: default
title: Setting a Static IP
grand_parent: Installation
parent: Raspberry Pi OS
nav_order: 6
permalink: /install/os/static-ip
---
# Set your Static IP Address

To set the static IP Address for LX Monitor, you will need to access the `rootfs` partition. 

1) Open the file `/etc/dhcpd.conf` in Notepad or your terminal editor of choice.
2) At the bottom of the file add the following:

This block handles the LX Network Interface, here we are using [our standard IP Address ranges][HyperLXIPRanges] based on [ETC's ranges][ETCRanges]:
```
interface eth0
static ip_address=10.101.123.254
static routers=10.101.1.1
```

This block handles the Public Network Interface, please use the details that will work for your network (You may need to request a static IP address from your IT Department).
```
interface eth1
static ip_address=192.168.1.91/24
static routers=192.168.1.1
static domain_name_servers=1.1.1.1 8.8.8.8 8.8.4.4
```

Subnets are handled as part of the IP Address using CIDR Notation, use [this cheat sheet][CIDRCheatSheet] to work out what yours should be. This is placed at the end of the IP Address. For example:

```
IP Address = 192.168.1.99
Subnet Mask = 255.255.255.0
CIDR Notation = /24

Resulting IP Address = 192.168.1.99/24
```

[CIDRCheatSheet]: https://nsrc.org/workshops/2009/summer/presentations/day3/subnetting.pdf "CIDR Notation Cheat Sheet"
[HyperLXIPRanges]: https://github.com/hyperlighting/standardipranges
[ETCRanges]: https://support.etcconnect.com/ETC/Networking/General/ETC_Network_IP_Addresses "ETC network IP Address Ranges"