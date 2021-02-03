#!/bin/bash
docker rm notebook
docker run -p 8888:8888 -v "/Users/Sameer/Downloads:/home/jovyan/Downloads" -v "$PWD/notebooks:/home/jovyan/work" --name notebook ss-notebook
