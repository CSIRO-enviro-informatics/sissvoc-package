#!/bin/bash
## This script downloads  elda and sissvoc releases, unpacks and packages the relevant files into sissvoc.war
set -x #echo on

#clone and build elda - for some reason in windows, mvn doesn't want to build elda from the git repo tag. 
#git clone https://github.com/epimorphics/elda.git
#cd elda
#git checkout tags/elda-1.3.4
#mvn package
#cd ..
#WORKAROUND FIX - download elda 1.3.4 release and unzip
#This version contains velocity templates which we will use for UI improvements 

#test if the elda dir is available 
if [ ! -d elda ]; then
   if [ ! -f elda-1.3.4.zip]; then
      curl -L -O https://github.com/epimorphics/elda/archive/elda-1.3.4.zip
   fi
   unzip elda-1.3.4.zip
   mv elda-elda-1.3.4 elda
fi

cd elda
mvn package
cd ..
#clone and build sissvoc vanilla - 
#WORKAROUND -  download sissvoc-vanilla-v0.2 release and unzip
#git clone https://github.com/jyucsiro/sissvoc.git
if [ ! -f sissvoc-vanilla-v0.2.zip ]; then
   curl -L -O https://github.com/jyucsiro/sissvoc/archive/sissvoc-vanilla-v0.2.zip
fi

if [ -d "sissvoc-vanilla" ]; then
   rm -r sissvoc-vanilla
fi

unzip sissvoc-vanilla-v0.2.zip
mv sissvoc-sissvoc-vanilla-v0.2 sissvoc-vanilla
#remove the -c from the line below (was not exucuting when run in the linux environment)
bash package-sissvoc-vanilla--no-build.sh

