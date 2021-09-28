---
layout: default
title: Create a Deploy Key
grand_parent: Installation
parent: Install LX Monitor
nav_order: 2
permalink: /install/lx-monitor/deploy-key
---
# Deploy Key

With private repos, you need to authenticate with GitHub before you can pull the code down. On our machines we can do this with SSH Keys and such on our accounts, but it's not the best way to do it on the Raspberry Pi. Instead we are going to use a deploy key.

A deploy key is essentially an SSH key which is tied specifically to the project, not the account. This lets us easily pull from the repo we need without having another key tied to our main account.

## Create a new SSH Key on the Raspberry Pi

On your Raspberry Pi that you intend to deploy LX Monitor on, we will start by creating a brand new SSH key.

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

You will be prompted for a location and a passphrase. Hitting enter will skip both of these and use the default location and no passphrase.

## Add the key to your config

Now we can create an SSH config file for our user, and add our key.

```
nano ~/.ssh/config
```

Add the following to the file:

```
Host github.com
    Hostname github.com
    IdentityFile ~/.ssh/id_ed25519
```

## Test your connection

You can test your connection with the following command:

```
ssh -T git@github.com
```

You should get a response similar to below

```
Hi <YOURUSERNAME/ORG>/LX-Monitor-Main! You've successfully authenticated, but GitHub does not provide shell access.
```

## Add your key to GitHub

Now you can follow the [official guide][DeployKeyGuide], and add this newly created key as a Deploy key on your repository.

[DeployKeyGuide]: https://docs.github.com/en/developers/overview/managing-deploy-keys#deploy-keys