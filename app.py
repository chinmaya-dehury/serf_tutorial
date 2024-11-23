from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def hello_world():
    container_id = socket.gethostname()
    container_ip = socket.gethostbyname(container_id)
    return f"Hello World from container {container_id} with IP {container_ip}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
