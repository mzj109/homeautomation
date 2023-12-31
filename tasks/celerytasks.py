from celery import Celery
import time
import subprocess
from tasks import devices
from data_model import onkyo_cmd_codes,volumio_cmd_codes
import weather.weather_broadcast

#celery_app = Celery('tasks', broker='redis://localhost:6379//',backend='redis://localhost:6379')
celery_app = Celery('tasks')
celery_app.config_from_object('celeryconfig')

# task do download yt items.
# 
@celery_app.task(name='dlurl_task',bind=True, autoretry_for=(Exception,), exponential_backoff=25, retry_kwargs={'max_retries': 0}, retry_jitter=True)
def dlurl_task(self,youtube_url, musictype):
    subprocess.check_call(['bash','/home/pi/code/homeautomation/shell/youtube_downloader.sh',youtube_url,musictype])

@celery_app.task(bind=True,retry_kwargs={'max_retries': 0})
def onkyo_task(self,the_command):
    code_and_times_to_run =  onkyo_cmd_codes.Onkyo[the_command].value # onkyo_commands.get_onkyo_code(the_command)
    devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), int(code_and_times_to_run[1]))

@celery_app.task(bind=True)
def volumio_task(self,the_command,retry_kwargs={'max_retries': 0}):
    print(the_command)
    api_call = volumio_cmd_codes.Volumio[the_command].value
    devices.volumio_command_exec(api_call[0])

@celery_app.task(bind=True)
def weather_task(self, dlurl):
    state =devices.volumio_command_exec(volumio_cmd_codes.Volumio.STATE.value)
    print(state,flush=True)
    restart = False
    if state['status'] == str.lower(volumio_cmd_codes.Volumio.PLAY.name):
        restart = True
        print ("Will restart after Weather",flush=True)
    devices.volumio_command_exec(volumio_cmd_codes.Volumio.STOP.value)
    code_and_times_to_run = onkyo_cmd_codes.Onkyo.ON.value  # in case amp is off
    devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), int(code_and_times_to_run[1]))
    time.sleep(8)
    code_and_times_to_run = onkyo_cmd_codes.Onkyo.SET_VOLUMIO_SOURCE.value  # in case amp is off
    devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), int(code_and_times_to_run[1]))
    weather.weather_broadcast.broadcast()
    if restart == True:
        devices.volumio_command_exec(volumio_cmd_codes.Volumio.PLAY.value)

@celery_app.task(bind=True)
def stop_all(self, dlurl):
    devices.volumio_command_exec(volumio_cmd_codes.Volumio.STOP.value)
    code_and_times_to_run = onkyo_cmd_codes.Onkyo.OFF.value
    devices.onkyo_command_exec(str(code_and_times_to_run[0]).encode(), int(code_and_times_to_run[1]))
    subprocess.check_call('nohup ~/code/shell/stop-all.sh &',shell=True)

@celery_app.task(bind=True, trail=True)
def dlurl_log(self):
    log_lines=str(subprocess.check_output('grep -Ei "download|merg|error" ~/code/logs/celery.log |grep -v "dlurl_log"'
                                          ,shell=True
                                          , universal_newlines=True ))
    log_lines = log_lines.replace('\n','<p>')
    #print (str(log_lines))
    #log_lines = "A"
    return log_lines

@celery_app.task(bind=True)
def app_log(self):
    celery_log_lines = str(
            subprocess.check_output("cat ~/code/logs/celery.log"
                                    , shell=True
                                    , universal_newlines=True))
    celery_log_lines = celery_log_lines.replace('\n', '<p>')

    controller_log_lines = str(
        subprocess.check_output("cat ~/code/logs/controller.log"
                                , shell=True
                                , universal_newlines=True))
    controller_log_lines = controller_log_lines.replace('\n', '<p>')
    return "<h1>Celery Task log</h1><p>"+celery_log_lines+"<br><h1>Bottle web log</h1><p>"+controller_log_lines

@celery_app.task(bind=True)
def nmap_task(self):
    subprocess.check_call('bash ~/code/shell/nmap.sh',shell=True)

