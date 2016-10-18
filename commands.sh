#!/bin/bash
# Commands to be called from the Makefile

PREFIX="org.gnome.settings-daemon.plugins"
PATTERN='wacom'
SCRIPTNAME=`basename "$0"`
AUTOSTART_DIR=~/.config/autostart/

case "$1" in
    enable-wacom-plugin)
        # Activates gnome-settings-daemon wacom plugin
        echo "Activating your Wacom gnome-settings-daemon plugin ..."
        gsettings list-recursively "$PREFIX" | sort | uniq \
        | grep "$PATTERN" \
        | while read schema key value; do
            if test "x$key" = "xactive"; then
                echo "$schema -> on"
                gsettings set "$schema" active true
            fi
        done
    ;;
    enable-gnome-plugins)
      # Activates all gnome-settings-daemon plugins
      echo "Enabling all gnome-settings-daemon plugins..."
      gsettings list-recursively "$PREFIX" | sort | uniq \
      | while read schema key value; do
          if test "x$key" = "xactive"; then
              echo "$schema -> off"
              gsettings set "$schema" active false
          fi
      done
    ;;
    disable-gnome-plugins)
      read -e -p "Disable useless gnome-settings-daemon plugins? This will break gnome desktop. (y/n): " -i "n" disable_plugins_agreement
      if [ "$disable_plugins_agreement" == "y" ]; then
        # Desactivates all gnome-settings-daemon plugins except wacom
        echo "Inactivating your non-Wacom gnome-settings-daemon plugins..."
        gsettings list-recursively "$PREFIX" | sort | uniq \
        | while read schema key value; do
            if test "x$key" = "xactive"; then
                echo "$schema -> off"
                gsettings set "$schema" active false
            fi
        done
      fi
    ;;
    enable-wacom-icon)
      # Makes wacom icon executable from XFCE. Also creates shortcup in CP.
      sudo sed -i '/NoDisplay/c\NoDisplay=false' \
      /usr/share/applications/gnome-wacom-panel.desktop
      sudo sed -i '/OnlyShowIn/c\OnlyShowIn=GNOME;XFCE;' \
      /usr/share/applications/gnome-wacom-panel.desktop
      sudo sed -i '/Categories/c\Categories=GNOME;GTK;Settings;HardwareSettings;X-GNOME-Settings-Panel;XFCE;GTK;Settings;DesktopSettings;X-XFCE-SettingsDialog;X-XFCE-HardwareSettings;' \
      /usr/share/applications/gnome-wacom-panel.desktop
    ;;
    disable-wacom-icon)
      # Revert the operation
      sudo sed -i '/NoDisplay/c\NoDisplay=true' \
      /usr/share/applications/gnome-wacom-panel.desktop
      sudo sed -i '/OnlyShowIn/c\OnlyShowIn=GNOME;' \
      /usr/share/applications/gnome-wacom-panel.desktop >&2
      sudo sed -i '/Categories/c\Categories=DesktopSettings;GTK;Settings;Utility;' \
      /usr/share/applications/gnome-wacom-panel.desktop >&2
    ;;
    enable-autostart-gnome-settings-daemon)
      # Autostarts GNOME settings daemon for XFCE
      mkdir -p $AUTOSTART_DIR
      sudo cp gnome-settings-daemon-for-xfce.desktop $AUTOSTART_DIR/gnome-settings-daemon-for-xfce.desktop
    ;;
    disable-autostart-gnome-settings-daemon)
      # Won't Autostart GNOME settings daemon for XFCE
      sudo rm $AUTOSTART_DIR/gnome-settings-daemon-for-xfce.desktop
    ;;
    install-dependencies)
      # Installs the required dependencies
      read -e -p "Install dependencies? (y/n): " -i "y" dependencies_agreement
      if [ "$dependencies_agreement" == "y" ]; then
    	  echo "Installing dependencies..."
    	  sudo apt-get install --no-install-recommends --no-install-suggests \
    		gnome-settings-daemon gnome-control-center
    	fi
    ;;
    uninstall-dependencies)
      # Prompt the user to uninstall the dependencies
      read -e -p "Uninstall dependencies? Choose 'n' if you use Gnome as secondary desktop environment (y/n): "\
       -i "y" dependencies_agreement
      if [ "$dependencies_agreement" == "y" ]; then
        @echo "Uninstalling dependencies..."
        sudo apt-get remove gnome-settings-daemon gnome-control-center
      fi
    ;;
    *)
        echo "USAGE:"
        echo "    $SCRIPTNAME { OPTION }"
        echo "OPTIONS:"
        echo "    enable-gnome-plugins"
        echo "    disable-gnome-plugins"
        echo "    enable-wacom-plugin"
        echo "    enable-wacom-icon"
        echo "    disable-wacom-icon"
        echo "    enable-autostart-gnome-settings-daemon"
        echo "    disable-autostart-gnome-settings-daemon"
        echo "    install-dependencies"
        echo "    uninstall-dependencies"
        exit 2
    ;;
esac
