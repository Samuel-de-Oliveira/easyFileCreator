#!/usr/bin/env bash

if [ $USER == "root" ]; then
	echo "No root!"
	exit
fi

clear
echo -e "\033[1mInstall program.\033[m"
echo -e "\nVersion of Program: \033[33m1.0\033[m\n"
echo -e "\nThe installing starts! This will not take long.\n"
	
sudo mkdir -p /usr/share/efc/
sudo cp -r ./* /usr/share/efc/

mkdir -p ~/.efc/
cp -r langs/ ~/.efc/

sudo cp efc /usr/bin/
	
echo -e "\nEverything is done!\n"
echo -e "\033[34;1mPress return to exit...\033[m"; read
clear
