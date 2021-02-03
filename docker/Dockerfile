FROM jupyter/scipy-notebook
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    imagemagick && \
    rm -rf /var/lib/apt/lists/*
RUN pip install fitparse
USER $NB_UID
