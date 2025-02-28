__version__: str = '0.1'
__authot__: str = 'Your name'
__doc__: str = 'Your doc'

__all__: list = [
    'hello'
]

class hello():
    def __init__(self, msg) -> None:
        self.Message: str = msg

    def show(self) -> None:
        if self.Message:
            print(self.string)
        else:
            print('Your string is empty')
