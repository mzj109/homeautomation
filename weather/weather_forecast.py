#jhala
from noaa_sdk import noaa

def get_weather(zip=21042):
    def forecast_summary(summary_list):
        place = None
        summary = []
        for i in summary_list:
            if place is None:
                # print(i)
                summary.append(i)
            elif place == i:
                1
            elif place != i:
                # print(i)
                summary.append(i)
            place = i
        return summary

    n = noaa.NOAA()
    res = n.get_forecasts('21042', 'US', True)

    #curr_day = [ v['startTime'][0:10] for v in res ][0]
    days = list(set([ v['startTime'][0:10] for v in res ]))
    days.sort()
    days_dict = [ ( 'Hello Hello, today\'s forecast:' , days[0] ) , ('Tomorrow\'s forecast:', days[1] )]
    weather_report =[]
    for dat in days_dict:
        weather_report.append(dat[0])
        shortForecasts = [ v['shortForecast'] for v in res if v['startTime'][0:10]==dat[1]] + ['.']
        weather_report.append(",".join(forecast_summary(shortForecasts)))

        temps=[ v['temperature'] for v in res if v['startTime'][0:10]==dat[1]]
        temps.sort()
        min = temps[0]
        max = temps[-1]
        weather_report.append("Minimum temperature:" + str(min) + ", and Maximum temperature:" + str(max) + " degrees.")

    return (" ".join(weather_report))
