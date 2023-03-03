#--*- Easy File Creator (EFC) -*--#
#                                 #
#--*---------------------------*--#

import os
import sys
import json
from lib import *

# If it hasn't no arguments
if len(sys.argv) <= 1: 
    helpMessage()
    exit()


if __name__ == "__main__":

    # Arguments:
    if sys.argv[1] in ("help", "-?"): helpMessage() # Help
    elif sys.argv[1] in ("file", "-f"): createFile(sys.argv[2], sys.argv[3]) # Create file
    elif sys.argv[1] in ("project", "-P"): createProject(sys.argv[2], sys.argv[3]) # Crate project
    elif sys.argv[1] in ("version", "-v"): print(Version) # Show version Version
    elif sys.argv[1] in ("append", "-a"): appendTemplate(sys.argv[2]) # Append a template
    elif sys.argv[1] in ("remove", "-R"): removeTemplate(sys.argv[2]) # Remove a template

    # In case of user digit someting wrong
    else: print("Sorry, this command doesn't exist. digit \'neo-git -?\' for commands") 
