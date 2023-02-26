import os
import sys
import shutil
import json

Version = '2.0'

with open(f'{configPath}/langs/{Language}/config.json', 'r') as file:
        config = json.loads(file.read())

if os.name in ("linux", "posix"):
    programPath = '/usr/share/neo-git/'
    configPath  = f'/home/{os.getlogin()}/.neo-git/'

elif os.name in ("nt", "dos"):
    programPath = 'C:\\system32\\neo-git'
    configPath  = 'will be there...'


def helpMessage():
    print("""
There will come a help message...
          """)


def createFile(fileName, Language):
    shutil.copy(f"{configPath}/langs/{Language}/{config['file']}",
                f'{fileName}{config["extencion"]}')


def createProject(projectName, Language):
    shutil.copy(f"{configPath}/langs/{Language}/project/",
                f'{projectName}')
