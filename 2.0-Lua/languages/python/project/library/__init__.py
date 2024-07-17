__version__ = '1.0'

class Message():
    def __init__(self, message=None) -> None:
        self.message = message

    def printMessage(self) -> None:
        if self.message: print(self.message)
        else: print('Message is None...')
