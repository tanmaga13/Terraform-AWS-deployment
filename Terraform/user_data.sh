#!/bin/bash
set -e

cd /home/ubuntu

apt update -y
apt install -y python3 python3-pip git

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

git clone -b master https://github.com/tanmaga13/Terraform-dev.git Ares-app

cd Ares-app/ares-app
cd backend

apt install -y python3-venv

python3 -m venv venv

source venv/bin/activate

pip install -r requirements.txt

# Run Flask
nohup python app.py > backend.log 2>&1 &

cd ../frontend

npm install

nohup node app.js > frontend.log 2>&1 &
