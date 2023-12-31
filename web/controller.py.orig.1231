#
# Bottle Web
#
from bottle import Bottle, run, request, template, static_file
from tasks.celerytasks import dlurl_task, onkyo_task,  weather_task, stop_all, dlurl_log, app_log, nmap_task
from data_model import onkyo_cmd_codes
from data_model import music_types

onkyo_command_list = [name for name, member in onkyo_cmd_codes.Onkyo.__members__.items()  ]
app = Bottle()

# initial web page load
@app.route('/dlurl')
def dlurl():
   tout = template('./views/dlform.tpl', ret_string="", commands=onkyo_command_list, musictypes=music_types.musictypes)
   return tout

# get item from yt
@app.route('/dlurl', method='POST')
def dl_urlpost():
    youtube_url = request.forms.get("youtube_url")
    musictype = request.forms.get('musictype')

    if musictype == None:
        retstr = "<p>Please Choose a music type!</p>"
        return template('dlform.tpl', ret_string=retstr, commands=onkyo_command_list,musictypes = music_types.musictypes)

    if len(str.strip(youtube_url)) > 0:
       dlurl_task.apply_async([youtube_url,musictype], queue='local')
       #return "<p>Download requested: "+ dlurl + "</p>"
       return template('dlform.tpl', musictypes = music_types.musictypes , ret_string="Download requested: "+ youtube_url, commands=onkyo_command_list)
    else:
       retstr= "<p>Will not process empty request!!</p>"
       return template('dlform.tpl', ret_string=retstr, commands=onkyo_command_list,musictypes = music_types.musictypes)

# onkyo cmds
@app.route('/onkyocmd2', method='POST')
def onkyocmd():
   cmd = request.forms.get('the_command')
   #print (request.forms)
   if len(cmd) == 0:
       return template('dlform.tpl', ret_string="No Command Given", commands=onkyo_command_list)
   print('issuing command: '+cmd, flush=True)
   onkyo_task.delay(cmd)
   return  "Last Command: "+str(cmd)

@app.route('/weather', method='POST')
def volumio():
   print('issuing command: weather_task', flush=True)
   weather_task.delay("")
   retstr="Weather"
   return  "Last Command: "+str(retstr)
   #return template('dlform.tpl', ret_string=retstr, commands=onkyo_command_list, musictypes = music_types.musictypes )

@app.route('/stop_all', method='POST')
def volumio():
   stop_all.delay("")
   retstr="Stopping System"
   return  "Last Command: "+str(retstr)
   #return template('dlform.tpl', ret_string=retstr, commands=onkyo_command_list)

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static_files')

@app.route('/dlurl_log')
def get_dlurl_log():
    print('issuing command: dlurl_log', flush=True)
    get_log = dlurl_log.delay()
    get_log_string = str(get_log.get())
    return get_log_string

@app.route('/app_log')
def get_dlurl_log():
    print('issuing command: app_log', flush=True)
    get_log = app_log.delay()
    get_log_string = str(get_log.get())
    return get_log_string


@app.route('/show_devices', method='POST')
def show_devices():
    print('issuing command: nmap', flush=True)
    nmap_task.delay()
    #return template('dlform.tpl', ret_string="Network Mapper Executed", commands=onkyo_command_list,musictypes = music_types.musictypes)
    return  "Last Command: Show Devices Script Executed, See Report"


from paste import httpserver
httpserver.serve(app, host='0.0.0.0', port=8080)
