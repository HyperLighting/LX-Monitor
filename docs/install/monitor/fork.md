---
layout: default
title: Forking the Project
grand_parent: Installation
parent: Install LX Monitor
nav_order: 1
permalink: /install/lx-monitor/fork
---
# Forking the Project

The easiest way to deploy LX Monitor is via Git. This way, you can make changes on your local machine, update your fork, and then pull that deployment onto your monitor for use.

To assist with this, you will need to make a private fork of this project. A private fork can only be viewed by those you give access to, protecting anything sensitive about your deployment.

Unfortunately, GitHub doesn't allow you to fork a project via the website and make it private. As such you will need to follow these instructions to create a fork of the project that can be made private.

## Create a clone of the repo on your local machine

```
git clone --bare git@github.com:hyperlighting/lx-monitor.git
```

## Create a new repo on GitHub

In your own account (Or your organization account), [create a new private repo][CreatePrivateRepo] for this project. It is a good idea to name this the same as your hostname, which if your in a multi-venue space may relate to the space your are in. For example, we will use `LX-Monitor-Main` here.

## Mirror push the clone to your repo

```
cd lx-monitor.git
git push --mirror git@github.com:<YOURUSERNAME/ORG>/LX-Monitor-Main.git
```

## Remove the clone

```
cd ..
rm -rf lx-monitor.git
```

## Clone your new repo

```
git clone git@github.com:<YOURUSERNAME/ORG>/LX-Monitor-Main.git
```

## Add the Main LX Monitor project as a remote

Adding our LX Monitor repo will allow you to pull in updates down the line to keep the most complete package running.

```
git remote add upstream git@github.com:hyperlighting/lx-monitor.git
git remote set-url --push upstream DISABLED
```

## Fetching Updates

You should be able to fetch any updates by pulling from upstream, and then solving any conflicts.

[CreatePrivateRepo]: https://help.github.com/articles/creating-a-new-repository/ "Creating a new repository"