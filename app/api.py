from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def read_root():
    return {'Hello': 'World load balance app 2'}

@app.get('/hello')
def read_root2():
    return {'Hello': 'hello world'}