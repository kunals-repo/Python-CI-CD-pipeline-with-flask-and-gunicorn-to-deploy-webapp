#!/bin/bash

set -e

echo "Starting deployment..."

APP_DIR="/opt/python-app"

if [ ! -d "$APP_DIR" ]; then
    sudo mkdir -p $APP_DIR
    sudo chown -R $USER:$USER $APP_DIR
fi

rsync -av --delete ./ $APP_DIR

cd $APP_DIR

sudo python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

sudo pkill gunicorn || true

nohup gunicorn --bind 0.0.0.0:5000 app.main:app > app.log 2>&1 &

echo "Deployment completed successfully!"
