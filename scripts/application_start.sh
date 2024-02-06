#!/bin/bash

# give permission to the files inside /secure_docs directory

sudo chmod -R 777 /home/ubuntu/basic-api

sudo docker build . -t basic-api --no-cache

sudo docker run -d basic-api -p8000:8000 --name basic-api-i