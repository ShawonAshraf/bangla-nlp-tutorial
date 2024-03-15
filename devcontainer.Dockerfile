FROM continuumio/miniconda3:main

# copy environment.yml to the image
COPY ./envs/env_linux.yml /tmp/env_linux.yml


# create a new environment
RUN conda env create -f /tmp/env_linux.yml  
