from collections import OrderedDict
from enum import Enum, unique

@unique
class Volumio(Enum):
    # cmd = ( code, default times to run when issued)
    STOP = 'api/v1/commands/?cmd=stop'
    PLAY = 'api/v1/commands/?cmd=play'
    STATE = 'api/v1/getState'


