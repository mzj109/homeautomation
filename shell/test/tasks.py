from celery import Celery

app = Celery('tasks', broker='redis://192.168.1.249:6379' , backend='redis://192.168.1.249:6379/0')

@app.task
def add(x, y):
    return x + y


