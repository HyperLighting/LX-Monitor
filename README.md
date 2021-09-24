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

### NTP Server

Part of the system is a network time server to ensure that desks have the correct time. By default this uses the CloudFlare time server but can be configured to use others.
