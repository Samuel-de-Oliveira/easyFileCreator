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

# If it hasn't no arguments
if len(sys.argv) <= 1: 
    helpMessage()
    exit()

if __name__ == "__main__":
    try:
        # Arguments:
        if sys.argv[1] in ("help", "-?"): helpMessage() # Help
        elif sys.argv[1] in ("file", "-f"): createFile(sys.argv[2], sys.argv[3]) # Create file
        elif sys.argv[1] in ("project", "-P"): createProject(sys.argv[2], sys.argv[3]) # Crate project
        elif sys.argv[1] in ("append", "-a"): appendTemplate(sys.argv[2]) # Append a template
        elif sys.argv[1] in ("remove", "-R"): removeTemplate(sys.argv[2]) # Remove a template


        # Show version info
        elif sys.argv[1] in ("version", "-v"):
            print(f'Version: {Version}\n'
                   'This project is created by Samuel de Oliveira (all right reserved)\n'
                   'Visit the project\'s repository: https://github.com/Samuel-de-Oliveira/easyFileCreator.')

        # In case of user digit someting wrong
        else: print("Sorry, this command doesn't exist. digit \'efc -?\' for commands") 
    
    # In case of dont have enough arguments
    except IndexError:
        print('Missing arguments...\n'
              'Type "efc -?" for details of the commands')
    
    # In case of a unknown error happens
    except Exception as Except:
        print(f"An error has accured, the name of this error is {Except}\n"
               "Please tell this to the software developer")
