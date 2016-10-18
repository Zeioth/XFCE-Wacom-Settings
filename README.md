Introduction
=============
This script installs GNOME's 'Wacom Settings' in XFCE.

![Screenshot highlighting the settings' location](screenshot.png?raw=true)

Installation
==============
To install it, run the next command in this directory. After that you will find a new icon in your XFCE Settings.
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

**Why are my settings so ugly?**

You have to reboot after install.

**I disabled gnome-settings-daemon plugins. How do I restore them?**
```
./commands.sh enable-gnome-plugins
```

**I'm an advanced user. How can I check the debugging commands?**
```
./commands.sh --help
```

**I'm using an old PC. How can I save RAM?**

After the installation run 
```
./commands.sh disable-autostart-gnome-settings-daemon
```
You will save ~25MB. The settings will be shown using GTK. The leds in your tablet may not turn on. It works, though.

Pourpose
==================
We are aiming to implement this panel natively on XFCE. Meanwhile, you can install it from here.

Credits: Based on [achadwick's script](https://github.com/achadwick/gsdwacom4xfce). Currently developed by Zeioth.

