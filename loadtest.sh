#!/usr/bin/env bash
HOSTNAME="https://flask-app-ml.azurewebsites.net/"
USERS=500
SPAWN_RATE=2

locust --headless -f locustfile.py --host $HOSTNAME --users $USERS --spawn-rate $SPAWN_RATE