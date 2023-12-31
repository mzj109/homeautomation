# if its before 0830 hrs, broadcast weather and play music, on boot.
#set -xv
cd ~/code
. ./shell/appenv

echo "AM START $(date)"
now=$(date +%H%M|bc)

if [ $now -gt 945 ]; then
 echo "Its too late..."
 date
 exit
fi

 python3 -c "from tasks import devices;from data_model import onkyo_cmd_codes;code_and_times_to_run = onkyo_cmd_codes.Onkyo.ON.value;devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), int(code_and_times_to_run[1]))"
 sleep 4
 python3 -c "from tasks import devices;from data_model import onkyo_cmd_codes;code_and_times_to_run = onkyo_cmd_codes.Onkyo.VOLDOWN.value;devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), 6)"
 sleep 10
 python3 -c "from tasks import devices;from data_model import onkyo_cmd_codes;code_and_times_to_run = onkyo_cmd_codes.Onkyo.SET_VOLUMIO_SOURCE.value;devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), 1)"
 python3 -c "import weather.weather_broadcast;weather.weather_broadcast.broadcast()"
 curl localhost:3000/api/v1/commands/?cmd=play
