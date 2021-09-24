# LX Monitor

LX Monitor is an all in one solution to actively monitor your lighting network, report faults, and generally make life a bit easier.

The system is built around the Raspberry Pi 4. The Pi, along with an additional USB Network Adapter bridges your lighting network and the outside world.

## Features

- DHCP Server
- Network Time Server
- Samba Shares for your Lighting Desk
    - Synced with OneDrive
    - Synced with Local Network Storage

## Installation

See the [installation document](INSTALLATION.md) for complete instructions.

## Hardware

- Raspberry Pi 4
- SD Card
- USB Network Adapter
- USB Memory Stick

## Networking

LX Monitor requires two separate networks. One for the Lighting Network and another for the internet. LX Monitor doesn't bridge the networks so everything is still kept separate.

The Lighting network utilizes the onboard network adapter on the Raspberry Pi. It's important that it uses this as most of the communication with devices will be on the Lighting network.

The internet facing network uses a USB Ethernet Adapter. We recommend [this one by Anker][AnkerUSBEthernet] as that is what we used during development, however any other compatible adapter should work. LX Monitor uses this network to provide a large range of uses, including sending alerts, syncing with third party systems and administration.

By default, we disable both the WiFi and Bluetooth onboard the Raspberry Pi, however, where required these can be used. For example, if it is not possible to get physical internet facing network to the Raspberry Pi's location, you could use WiFi for that network.

### NTP Server

Part of the system is a network time server to ensure that desks have the correct time. By default this uses the CloudFlare time server but can be configured to use others.

[AnkerUSBEthernet]: https://www.amazon.co.uk/Anker-Portable-Ethernet-Supporting-Notebook-Black-USB-3-0/dp/B00NPJP33M/ref=sr_1_3?keywords=anker+gigabit+usb+ethernet&qid=1569024148&s=computers&sr=1-3