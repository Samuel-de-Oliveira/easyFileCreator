#--*--------- Easy File Creator (EFC) ---------*--#
#                                                 #
# This is a free software, thats mean you can     #
# distibute, run and edit it freely, but you need #
# to follow the MIT license guideless.            #
#                                                 #
# Repository:                                     #
# https://github.com/Samuel-de-Oliveira/easyFileCreator
# License:       MIT                              #
# Created by:    Samuel de Oliveira               #
# Contribuitors: None                             #
#--*-------------------------------------------*--#

# Imports
import sys

# All functions is in lib/__init__.py file
from lib import *
from lib import __version__

# If it hasn't no arguments
if len(sys.argv) <= 1: 
    helpMessage()
    exit()


## Main code ##
if __name__ == "__main__":
    try:
        # Arguments:
        if sys.argv[1] in ("help", "-?"): helpMessage() # Help
        elif sys.argv[1] in ("file", "-f"): createFile(sys.argv[2], sys.argv[3]) # Create file
        elif sys.argv[1] in ("project", "-P"): createProject(sys.argv[2], sys.argv[3]) # Crate project
        elif sys.argv[1] in ("append", "-a"): appendTemplate(sys.argv[2]) # Append a template
        elif sys.argv[1] in ("remove", "-R"): removeTemplate(sys.argv[2]) # Remove a template
        elif sys.argv[1] in ("list", "-l"): showList() # Show list of templates


        # Show version info
        elif sys.argv[1] in ("version", "-v"):
            print(f'Version: \033[1;32m{__version__}\033[m\n'
                   'This project is created by Samuel de Oliveira (all right reserved)\n'
                   'Visit the project\'s repository: \033[34mhttps://github.com/Samuel-de-Oliveira/easyFileCreator.\033[m')

        # In case of user digit someting wrong
        else: print("Sorry, this command doesn't exist. digit \033[1;42mefc -?\033[m for commands") 
   

    # In case of dont have enough arguments
    except IndexError:
        print('\033[1mMissing arguments...\033[m\n'
              'Type \033[1;42mefc -?\033[m for details of the commands')
    
    # In case of a unknown error happens
    except Exception as Except:
        print(f"\033[1;31mAn error has accured, the name of this error is {Except}\033[m\n"
               "Please tell this to the software developer")
