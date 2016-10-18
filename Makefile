

all:
	@echo "usage: make { install | uninstall }"

install:
	./commands.sh install-dependencies
	./commands.sh disable-gnome-plugins
	./commands.sh enable-wacom-plugin
	./commands.sh enable-wacom-icon
	./commands.sh enable-autostart-gnome-settings-daemon
	@echo "[ Installation complete! ]"
	@echo "HINT: You can find the new icon in your XFCE configuration panel."

uninstall:
	./commands.sh disable-wacom-icon
	./commands.sh enable-gnome-plugins
	./commands.sh uninstall-dependencies
	./commands.sh disable-autostart-gnome-settings-daemon
	@echo "[ Wacom panel uninstalled OK ]"
