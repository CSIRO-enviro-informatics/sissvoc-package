#!/bin/bash

#docker run --name "sissvoc" -P -it csiro_env/sissvoc /bin/bash
docker run --name "sissvoc" -P -d csiro_env/sissvoc /opt/tomcat/bin/deploy-and-run.sh
