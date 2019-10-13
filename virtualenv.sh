#!/bin/bash
echo "###########################################" 
echo "creating virtualenv for python" 
echo "###########################################" 

su daniel -c "virtualenv -p python3 /home/daniel/.venv/python"
su daniel -c "pip install --upgrade pip"
su daniel -c "virtualenv -p python3 /home/daniel/.venv/youtube-dl"
su daniel -c "pip install --upgrade pip"
su daniel -c "pip install youtube-dl"
