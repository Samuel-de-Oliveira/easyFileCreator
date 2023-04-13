# Import area
import os
import sys
import shutil
import json

# Variable of version
Version = '1.0'

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


# Help
def helpMessage():
    print("""
\tEasy File Creator (EFC) usage
\tefc [Command...] (arguments...)

\033[1mfile (-f):\033[m Create a file (efc file [File name] [Language])
\033[1mproject (-P):\033[m Crate a project folder (efc project [Folder name] [Language])

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
        shutil.copy(f"{configPath}/langs/{Language}/{config['file']}",
                    f'{fileName}{config["extension"]}')
    except FileNotFoundError: print('The language doesn\'t exist!')
    except Exception as Except:
        print(f"An error occurred, the error name is {Except}."
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
        except FileNotFoundError: print('The language doesn\'t exist')
        except Exception as Except:
            print(f"An error occurred, the error name is {Except}."
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
        print(f"An error occurred, the error name is {Except}."
               "Please tell this with the developer!")


# Remove template
def removeTemplate(Language):
    try: shutil.rmtree(f"{configPath}/langs/{Language}")
    except FileNotFoundError: print('This template doesn\'t exist!')
    except Exception as Except:
        print(f"An error occurred, the error name is {Except}."
               "Please tell this with the developer!")
