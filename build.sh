#!/bin/bash

docker kill sissvoc 
docker rm sissvoc


docker build -t csiro_env/sissvoc .

