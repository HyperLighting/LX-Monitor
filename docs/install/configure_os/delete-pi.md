---
layout: default
title: Delete Pi User
grand_parent: Installation
parent: Setup Base OS
nav_order: 5
permalink: /install/os-setup/delete-pi
---
# Delete the default user account

Finally, we can delete the original `pi` user account. Run the following command:

```
sudo deluser --remove-home pi
```