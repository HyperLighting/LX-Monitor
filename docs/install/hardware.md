---
layout: default
title: Hardware
parent: Installation
nav_order: 1
permalink: /install/hardware
---

## Configuring the Raspberry Pi


## Getting your copy of the Project

### Fork the project

The easiest way to deploy LX Monitor is via Git. This way you can make changes and track them easily, and then deploy them with a single command to your monitor.

To assist with this, you will need to create a fork of this project for you to work from. Unfortunately GitHub doesn't allow private forks of a public project, so you will need to [follow our guide](PRIVATE-FORK.md) for info on how to do this. Once you are happy with your changes, you can push it back to your fork and clone that to your Raspberry Pi.

> Ensure that your fork is set to private. Any very sensitive information will be excluded from Git by default, but some information may be better not shared publicly.

### Clone your Project to your computer

Now that you have Git installed on your computer, you can clone it (download) and start making changes. You can do this from the command line/terminal, here we are using the main project source:

```
git clone git@github.com:YOURUSERNAME/hyperlighting/lx-monitor
```

As your project is likely private, you will need to specify your username when cloning. It will then ask you for your password to complete the clone. If you have 2 factor authentication turned on, you may need to generate an access token to use instead.
