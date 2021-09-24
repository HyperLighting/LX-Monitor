# Installation

## Installing Raspberry Pi OS

The first step in the process is to install Raspberry Pi's base operating system onto an SD Card.

1) Download "Raspberry Pi OS Lite" from the [Raspberry Pi Foundation's website][RPIDownload]
2) Download the [Etcher][EtcherDownload] Tool
3) Using the Etcher tool, flash the Raspberry Pi image to your SD Card

This results in a clean install of Raspberry Pi OS on the SD Card. Before we boot up for the first time, there are a few things we can configure now to make things go a little bit smoother.

By default, the installation of the OS onto the SD has created two partitions. One called `boot`, and the other called `rootfs`. The `boot` partition is fairly easy to access, being a MS-DOS (FAT 32) partition. In here we will set a few settings related to the hardware and boot up of the Raspberry Pi. The `rootfs` partition can be a bit more challenging to access, especially on Mac OS as it is a extFS partition. All the settings in this partition can be altered from the Raspberry Pi once it has booted, but you may need an external monitor and keyboard to set these up before using network access.

### Enable SSH

SSH will be the primary way we interact with the Raspberry Pi as the Lite OS has no desktop environment, and the project is intended to be installed in a rack and left to do it's thing.

To enable SSH on a fresh install:

#### Mac OS

1) Open the boot partition in your chosen Terminal:
```
cd /Volumes/boot
```

2) Create an empty file with no extension called `ssh`
```
touch ssh
```

#### Windows

1) Open the boot partition in File Explorer
2) Create a new file by right clicking **New > Text Document** and entering the name ssh. Before creating ensure you delete the `.txt` extension.

### Disable Bluetooth and WiFi

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

### Accessing the RootFS partition

The following settings require you to access the `rootfs` partition on the SD Card. Unfortunately, most system's aren't able to do this. 

On Mac OS, the best solution I have found is [extFS for Mac][extFSParagon], which has a free trial. Paragon do make a version for Windows, however it is classed as business software instead of being for home users, and requires you to contact them for pricing.

Linux machine's (Including another Raspberry Pi, if you are setting up multiple LX Monitors) have the drivers available to access the partition.

Alternatively, you can boot the Raspberry Pi up with a monitor and keyboard attached and set these settings from the Pi it's self before connecting to the networks.

### Set your Static IP Address

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

### Set your hostname

In most enterprise IT Networks, having a meaningful hostname is important. If you are only going to be running one LX Monitor, you could set the hostname to `LX-Monitor`, but if you are going to be running more, for example in your main stage, studio and rehearsal room, you could instead do `LX-Monitor-Main`, `LX-Monitor-Studio` and `LX-Monitor-Rehearsal`. Your IT Department may also have a standard they want you to follow.

Once you have chosen a hostname you can set it from the `rootfs` partition as follows:

1) Open the file `/etc/hostname` in Notepad or your terminal editor
2) Change the contents to your hostname & save
3) Open the file `/etc/hosts` in Notepad or your terminal editor
4) Add the following to the end of the file:

```
127.0.0.1   YOURHOSTNAME
```

### Boot up the Pi

Now that those settings are done, you can boot up the Raspberry Pi. 

1) Insert the SD Card into the back of the Raspberry Pi. 
2) If you need to do any of the settings once it's booted, connect a monitor and a keyboard.
3) Connect your Public Internet to the secondary adapter and the Lighting network to the onboard adapter.
4) Insert the power and let it boot up

If you are booting with a screen to finish the settings above, you can remove the keyboard and screen once you are done.

## Configuring the Raspberry Pi OS

### Connect via SSH to the Raspberry Pi

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

### Create a new User

To help keep the device secure, we are going to create a new user, and remove the old one. To create a new user, run the following command:

```
sudo useradd -m -u 1500 lxma
```

Then set the password with the following command:

```
sudo passwd lxma
```

Finally we need to give the new account elevated privileges with the following command:

```
sudo usermod -aG sudo lxma
```

### Log in with the new user account

Now we have an admin account for LX Monitor, we can logout with the command:

```
exit
```

Now reconnect using SSH using the new User Account we have set up.

### Delete the default user account

Finally, we can delete the original `pi` user account. Run the following command:

```
sudo deluser --remove-home pi
```

### Update the system

It is important to ensure we start with the most up-to-date version of Raspberry Pi OS and it's packages as possible. To update everything run the following commands:

```
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt autoremove
```

### Install Git

To be able to clone the LX Monitor project, you must first install Git. To do so, run the following command:

```
sudo apt-get install git
```

You will also need git installed on your computer, to make and push changes to your configuration before deploying it to your Raspberry Pi. Take a look at the [official guide to installing git][OfficialGitInstall] for information on how to do that. If you are looking for a graphical client, [GitKraken][GKClient] is one of the easiest to use.

## Getting your copy of the Project

### Fork the project

The easiest way to deploy LX Monitor is via Git. This way you can make changes and track them easily, and then deploy them with a single command to your monitor.

To assist with this, create a [fork of this project on GitHub][GitHubForkTutorial]. You can then clone that project to your computer and make changes. Once you are happy with your changes, you can push it back to your fork and clone that to your Raspberry Pi.

> Ensure that your fork is set to private. Any very sensitive information will be excluded from Git by default, but some information may be better not shared publicly.

### Clone your Project to your computer

Now that you have Git installed on your computer, you can clone it (download) and start making changes. You can do this from the command line/terminal, here we are using the main project source:

```
git clone git@github.com:YOURUSERNAME/hyperlighting/lx-monitor
```

As your project is likely private, you will need to specify your username when cloning. It will then ask you for your password to complete the clone. If you have 2 factor authentication turned on, you may need to generate an access token to use instead.


[RPIDownload]: https://www.raspberrypi.org/software/operating-systems/ "Raspberry Pi Foundation"
[EtcherDownload]: https://www.balena.io/etcher/ "Etcher"
[extFSParagon]: https://www.paragon-software.com/home/extfs-mac/ "extFS for Mac by Paragon"
[CIDRCheatSheet]: https://nsrc.org/workshops/2009/summer/presentations/day3/subnetting.pdf "CIDR Notation Cheat Sheet"
[HyperLXIPRanges]: https://github.com/hyperlighting/standardipranges
[ETCRanges]: https://support.etcconnect.com/ETC/Networking/General/ETC_Network_IP_Addresses "ETC network IP Address Ranges"
[PuttyDownload]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html "PuTTY SSH Client"
[MTPuttyDownload]: https://ttyplus.com/downloads/ "Multi Tabbed PuTTY"
[HyperDownload]: https://hyper.is/ "Hyper Terminal"
[GitHubForkTutorial]: https://docs.github.com/en/get-started/quickstart/fork-a-repo "How to fork a project on GitHub"
[OfficialGitInstall]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "Installing Git"
[GKClient]: https://www.gitkraken.com/ "GitKraken Client"