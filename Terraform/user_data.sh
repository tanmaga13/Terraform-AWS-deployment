#!/bin/bash
set -e

cd /home/ubuntu

apt update -y
apt install -y python3 python3-pip git

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

git clone -b devops/docker https://github.com/tanmaga13/assignments.git Ares-app

cd Ares-app
cd backend

pip3 install -r requirements.txt

nohup python3 app.py > backend.log 2>&1 &

cd ../frontend

npm install

nohup node app.js > frontend.log 2>&1 &
