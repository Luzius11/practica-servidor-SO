from bottle import Bottle, run
from datetime import datetime
import subprocess

app = Bottle()

@app.route('/hi')
def hi():
    now = datetime.now()
    return f"Hola! Hoy es {now}"

@app.route('/status')
def status():
    services = subprocess.getoutput("systemctl list-units --type=service --state=running")
    return "<pre>" + services + "</pre>"

run(app, host='0.0.0.0', port=8080)
