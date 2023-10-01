# Import area
import os
import sys
import shutil
import json

# Variable of version
Version = '1.0.1'

## Define the paths of software in each OS.
# Linux
if os.name in ("linux", "posix"):
    programPath = '/usr/share/efc/'
    configPath  = f'/home/{os.getlogin()}/.efc/'

# Windows
elif os.name in ("nt", "dos"):
    # TODO: rework this in the windows OS
    programPath = 'C:\\system32\\efc'
    configPath  = 'will be there...'

    # For while it doesn't work for Windows yet :/
    print('This software doesn\'t work for Windows yet')
    exit()


# Help
def helpMessage():
    print("""
\tEasy File Creator (EFC) usage
\tefc [Command...] (arguments...)

\033[1mfile (-f):\033[m Create a file (efc file [File name] [Language])
\033[1mproject (-P):\033[m Crate a project folder (efc project [Folder name] [Language])
\033[1mlist (-l):\033[m Show all templates saved (efc list)

\033[1mversion (-v):\033[m show version (efc version)
\033[1mhelp (-?):\033[m show this help message (efc help)
          """)


# Create a file
def createFile(fileName, Language):
    # Open config file of Template
    with open(f'{configPath}/langs/{Language}/config.json', 'r') as file:
        config = json.loads(file.read())

    # And then copy the template file and rename to name you've choosed
    try:
        # Verify if the file exists, to avoid replace a important file.
        if os.path.exists(f'{fileName}{config["extension"]}'): raise FileExistsError

        shutil.copy(f"{configPath}/langs/{Language}/{config['file']}",
                    f'{fileName}{config["extension"]}')

    except FileNotFoundError: print('The language doesn\'t exists!')
    except FileExistsError:
        print(f'The file \033[1m{fileName}\033[m already exists, '
               'then delete this file or choose a new name for it.')
    except Exception as Except:
        print(f"An error occurred, the error name is {Except}. "
               "Please tell this with the developer!")


# Create a project
def createProject(projectName, Language):
    # Open config file of Template
    with open(f'{configPath}/langs/{Language}/config.json', 'r') as file:
        config = json.loads(file.read())

    # Verify if the template have a project
    if config['project']:
        # And then copy the template project and rename to name you've choosed
        try:
            shutil.copytree(f"{configPath}langs/{Language}/project/",
                            f'{projectName}')

        except FileNotFoundError: print('The language doesn\'t exists')
        except FileExistsError:
            print(f'The directory \033[1m{projectName}\033[m already exists, '
                   'then delete this directory or choose a new name for it.')
        except Exception as Except:
            print(f"An error occurred, the error name is {Except}. "
                   "Please tell this with the developer!")
    else: print('No projects here sir...')

# Append template
def appendTemplate(Dir):
    # FIXME: The software cant append any template for any reason, need fix this urgent.
    try:
        if os.path.exists(f'{Dir}/config.json'):
            shutil.copy(f"./{Dir}",
                        f"{configPath}/langs/")
        else: raise FileNotFoundError

    except FileNotFoundError: print("Directory not found!")
    except Exception as Except:
        print(f"An error occurred, the error name is {Except}. "
               "Please tell this with the developer!")


def showList():
    # Print all templates
    langsList = os.listdir(f"{configPath}/langs/")
    print("Your language templates:")
    for lang in langsList:
        print(lang, end='  ')
    
    # New line
    print()


# Remove template
def removeTemplate(Language):
    try: shutil.rmtree(f"{configPath}/langs/{Language}")
    except FileNotFoundError: print('This template doesn\'t exist!')
    except Exception as Except:
        print(f"An error occurred, the error name is {Except}. "
               "Please tell this with the developer!")


if __name__ == "__main__": print("Please, open the \'Main.py\' file.")
