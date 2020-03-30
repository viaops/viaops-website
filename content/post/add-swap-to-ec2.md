---
title: "Adding swap to EC2 Instances"
date: 2015-08-04T21:55:06+01:00
draft: false
---



Generally all cloud instances come without swap and if you have a ram limited instance you should add swap to it.

```bash 

sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo chmod 600 /var/swap.1
sudo /sbin/swapon /var/swap.1

```



In order to make it persistent at restarts you need to add it to fstab.


```bash

/var/swap.1   swap    swap    defaults        0   0

```