import json
import urllib3
http = urllib3.PoolManager()




r = http.request('GET', 'http://localhost:3000/api/v1/getState')
print(json.loads(r.data.decode('utf-8')))

r = http.request('GET', 'http://localhost:3000/api/v1/commands/?cmd=stop')
print(json.loads(r.data.decode('utf-8')))

r = http.request('GET', 'http://localhost:3000/api/v1/commands/?cmd=play')
print(json.loads(r.data.decode('utf-8')))


