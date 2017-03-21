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

**Why it doesn't work? Why are my settings so ugly?**

You have to restart your PC after the installation is complete.

**I disabled the plugins. How do I restore them?**
```
./commands.sh enable-gnome-plugins
```

**I'm an advanced user. How can I check the debugging commands?**
```
./commands.sh --help
```

**It is compatible with any Linux distro?**

Yes. But if your distro is not based on Ubuntu, install the next packages:

    gnome-settings-daemon
    gnome-control-center

Pourpose
==================
We are aiming to implement this panel natively on XFCE. Meanwhile, you can install it from here.

Credits: Based on [achadwick's script](https://github.com/achadwick/gsdwacom4xfce). Currently developed by Zeioth.

