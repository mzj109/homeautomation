from gtts import gTTS
import weather.weather_forecast
import subprocess

def broadcast():
    print('getting weather',flush=True)
    forecast = weather.weather_forecast.get_weather()
    print('Converting to MP3', flush=True)
    tts = gTTS(forecast)
    tts.save('WEATHER.MP3')
    print('Playing', flush=True)
    subprocess.check_call(['mpg123', 'WEATHER.MP3'])