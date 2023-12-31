from tasks import devices
from data_model import onkyo_cmd_codes
c1 = str(onkyo_cmd_codes.Onkyo.VOLDOWN.value[0]).encode()
#print (c1)
devices.onkyo_command_exec(str(onkyo_cmd_codes.Onkyo.VOL30.value[0]).encode()  ,1 )


