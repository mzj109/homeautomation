from collections import OrderedDict
from enum import Enum, unique

@unique
class Onkyo(Enum):
    # cmd = ( code, default times to run when issued)
    ON = ('!1PWR01\r',1)
    OFF = ('!1PWR00\r',1)
    #VOL30 = ('!1MVL0x1e\r', 2)
    #VOL30 = ('!1MVL10\r', 2)
    VOLUP = ('!1MVLUP\r',2)
    VOLDOWN = ('!1MVLDOWN\r',2)
    SET_VOLUMIO_SOURCE = ('!1SLI03\r',1)
    SET_FIRETV_SOURCE = ('!1SLI02\r',1)
    SET_DVD_SOURCE = ('!1SLI10\r',1)
    MUTE = ('!1AMTTG\r',1)
    SET_STEREO = ('!1LMD00\r',1)
    SET_DIRECT = ('!1LMD01\r',1)
    SET_PURE_AUDIO = ('!1LMD11\r',1)

