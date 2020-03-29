import json
import urllib3
import serial
http = urllib3.PoolManager()

def onkyo_command_exec(the_command,times_to_run =1,command_type='execute'):
    ret_string =""
    with serial.Serial('/dev/ttyUSB0', 9800, timeout=1) as ser:

        if command_type == 'execute':
            with serial.Serial('/dev/ttyUSB0', 9800, timeout=1) as ser:
               for c in range(0,times_to_run):
                   print(the_command, flush=True)
                   ser.write(the_command)
        elif command_type == 'query':
               for c in range(0,times_to_run):
                   print(the_command, flush=True)
                   ser.write(the_command)
                   ret_string = str(ser.readline())
                   print ("Return from Onkyo:" +ret_string)

    ser.close()
    return ret_string

def volumio_command_exec(the_command):
    r = http.request('GET', 'http://localhost:3000/' + the_command)
    return json.loads(r.data.decode('utf-8'))