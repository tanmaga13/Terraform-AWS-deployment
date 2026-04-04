'''
from flask import Flask, jsonify, request, render_template
import os 
import json
from business import get_data

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/api', methods=['GET'])
def api():
    data = get_data()
    data = {
        'data': data
    }

    return jsonify(data)  
'''

from flask import Flask, request, render_template
from dotenv import load_dotenv
import os
import pymongo

load_dotenv()
MONGO_URL = os.getenv("MONGO_URL")
client = pymongo.MongoClient(MONGO_URL)
db = client.MyTCluster
collection = db['flask-assignment']

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/submit', methods = ['POST'])
def submit():
    form_data = dict(request.form)
    collection.insert_one(form_data)
    return "Data Submitted Successfully"

if __name__ == "__main__":
    app.run(port=8000, host = '0.0.0.0', debug=True)
