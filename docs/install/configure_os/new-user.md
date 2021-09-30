---
layout: default
title: Create a New User
grand_parent: Installation
parent: Setup Base OS
nav_order: 3
permalink: /install/os-setup/new-user
---

# Create a new User

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