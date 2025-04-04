# Import area
import os
import sys
import shutil
import json

# Variable of version
__version__: str = '1.0.2'
__author__: str = 'Samuel de Oliveira'
__all__: list = [
    'Config',
    'helpMessage',
    'createFile',
    'createProject',
    'appendTemplate',
    'showList',
    'removeTemplate',
]

## Define the paths of software in each OS.
# Linux
if os.name in ('linux', 'posix'):
    programPath: str = '/usr/share/efc/'
    configPath: str = f'/home/{os.getlogin()}/.efc/'
# Windows
elif os.name in ('nt', 'dos'):
    # TODO: rework this in the windows OS
    programPath: str = f'C:\\Users\\{os.getlogin()}\\AppData\\Roaming\\efc\\'
    configPath: str = programPath
    print(programPath)

    # For while it doesn't work for Windows yet :/
    print("This software doesn't work for Windows yet")
    exit()


class Config:
    def __ini__(self) -> None:
        pass


# Help
def helpMessage() -> None:
    print(
        """
\tEasy File Creator (EFC) usage
\tefc [Command...] (arguments...)

\033[1mfile (-f):\033[m Create a file (efc file [File name] [Language])
\033[1mproject (-P):\033[m Crate a project folder (efc project [Folder name] [Language])
\033[1mlist (-l):\033[m Show all templates saved (efc list)

\033[1mversion (-v):\033[m show version (efc version)
\033[1mhelp (-?):\033[m show this help message (efc help)
          """
    )


# Create a file
def createFile(fileName: str, Language: str) -> None:
    # Open config file of Template
    with open(f'{configPath}/langs/{Language}/config.json', 'r') as file:
        config: dict = json.loads(file.read())

    # And then copy the template file and rename to name you've choosed
    try:
        # Verify if the file exists, to avoid replace a important file.
        if os.path.exists(f'{fileName}{config["extension"]}'):
            raise FileExistsError

        shutil.copy(
            f"{configPath}/langs/{Language}/{config['file']}",
            f'{fileName}{config["extension"]}',
        )

    except FileNotFoundError:
        print("\033[1;31mThe language doesn't exists!\033[m")
    except FileExistsError:
        print(
            f'The file \033[1m{fileName}\033[m already exists, '
            'then delete this file or choose a new name for it.'
        )
    except Exception as Except:
        print(
            f'\033[31mAn error occurred, the error name is {Except}.\033[m '
            'Please tell this with the developer!'
        )


# Create a project
def createProject(projectName: str, Language: str) -> None:
    # Open config file of Template
    with open(f'{configPath}/langs/{Language}/config.json', 'r') as file:
        config: dict = json.loads(file.read())

    # Verify if the template have a project
    if config['project']:
        # And then copy the template project and rename to name you've choosed
        try:
            shutil.copytree(
                f'{configPath}langs/{Language}/project/', f'{projectName}'
            )

        except FileNotFoundError:
            print("The language doesn't exists")
        except FileExistsError:
            print(
                f'The directory \033[1m{projectName}\033[m already exists, '
                'then delete this directory or choose a new name for it.'
            )
        except Exception as Except:
            print(
                f'\033[1;31mAn error occurred, the error name is {Except}. \033[m'
                'Please tell this with the developer!'
            )
    else:
        print("there's no projects for this language...")


# Append template
def appendTemplate(Dir: str) -> None:
    # FIXME: The software cant append any template for any reason, need fix this urgent.
    try:
        if os.path.exists(f'{Dir}/config.json'):
            shutil.copy(f'./{Dir}', f'{configPath}/langs/')
        else:
            raise FileNotFoundError

    except FileNotFoundError:
        print('Directory not found!')
    except Exception as Except:
        print(
            f'\033[1;31mAn error occurred, the error name is {Except}. \033[m'
            'Please tell this with the developer!'
        )


def showList() -> None:
    # Print all templates
    langsList: list = os.listdir(f'{configPath}/langs/')
    print('Your language templates:')
    for lang in langsList:
        print(f'\033[1m{lang}\033[m', end='  ')

    # New line
    print()


# Remove template
def removeTemplate(Language: str) -> None:
    try:
        shutil.rmtree(f'{configPath}/langs/{Language}')
    except FileNotFoundError:
        print("This template doesn't exist!")
    except Exception as Except:
        print(
            f'\033[1;31mAn error occurred, the error name is {Except}. \033[m'
            'Please tell this with the developer!'
        )


if __name__ == '__main__':
    print("Please, open the 'Main.py' file.")
