#!/usr/bin/env sh
# Linux uninstaller

if [ $USER == "root" ]; then
	echo "No root!"
	exit 1
fi

clear
echo -e "\033[1mUninstall program.\033[m"
sudo rm -rf /usr/share/efc/
sudo rm -rf /usr/bin/efc
rm -rf ~/.efc/

echo -e "\nDone!\n"
echo -e "\033[34;1mPress return to exit...\033[m"; read
clear
