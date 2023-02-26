#!/usr/bin/env bash
#-*-------------- The installer for GNU/Linux --------------*-#

if [ $USER == "root" ]; then
	echo "No root!"
	exit 1
fi


clear
echo -e "\033[1mInstall program.\033[m"
echo -e "\nEstimated space used: 2Kb\nVersion of Program: \033[33m2.0\033[m\nAre you sure you want to install? [Y/n]:"; read num
clear


if [ $num == 'y' ] || [ $num == 'Y' ]; then

	echo -e "\nThe installing starts! This will not take long.\n"
	
	sudo mkdir -p /usr/share/neo-git/
	sudo cp -r ./* /usr/share/neo-git/

	mkdir -p ~/.neo-git/
	cp -r langs/ ~/.neo-git/langs/

	cp ngit /usr/bin/
	
	echo -e "\nEverything is done!\n"
	echo -e "\033[34;1mPress return to exit...\033[m"; read
	clear
fi
