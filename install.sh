#!/usr/bin/env bash

if [ $USER == "root" ]; then
	echo "No root!"
	exit
fi

clear
echo -e "\033[1mInstall program.\033[m"
echo -e "\nVersion of Program: \033[33m1.0.1\033[m\n"
	
sudo mkdir -p /usr/share/efc/
sudo cp -r ./* /usr/share/efc/

mkdir -p ~/.efc/
cp -r langs/ ~/.efc/

sudo cp efc /usr/bin/
	
echo -e "\nDone!\n"
echo -e "\033[34;1mPress return to exit...\033[m"; read
clear
