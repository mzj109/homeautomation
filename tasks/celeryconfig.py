#task_routes = {
#    'weather_tasks.add': 'weather_queue',
#}

#broker='redis://localhost:6379//'
#backend='redis://localhost:6379'

## Broker settings.
broker_url = 'redis://localhost:6379//'
result_backend = 'redis://localhost:6379'

# List of modules to import when the Celery worker starts.
imports = ('tasks.celerytasks')

worker_concurrency=1

task_annotations = {'tasks.add': {'rate_limit': '10/s'}}
