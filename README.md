**NEWS:** Gnome has updated their code recently, so this repository won't work for distros released after 2017, and rolling release distros (yet).

Introduction
=============
This script installs GNOME's 'Wacom Settings' in XFCE.

![Screenshot highlighting the settings' location](screenshot.png?raw=true)

Installation
==============
To install it, run the next command in this directory. After rebooting, you will find a new icon in your XFCE Settings.
```bash
make install
```

To uninstall it
```bash
make uninstall
```

FAQ
==============

**What options should I choose during the installation?**

Just press enter. The default configuration will work fine.

**Why doesn't it work? Why are my settings so ugly?**

You have to restart your PC after the installation is complete.

**I disabled the plugins. How do I restore them?**
```
./commands.sh enable-gnome-plugins
```

**I'm an advanced user. How can I check the debugging commands?**
```
./commands.sh --help
```

Compatibility
==================
If your distro is not based on Ubuntu, choose 'n' during 'install dependencies', and install manually the next packages:

    gnome-settings-daemon
    gnome-control-center
    
Purpose
==================
We are aiming to implement this panel natively on XFCE. Meanwhile, you can install it from here.

Credits: Based on [achadwick's script](https://github.com/achadwick/gsdwacom4xfce). Currently developed by Zeioth.

