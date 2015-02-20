#!/bin/bash
## This script assumes that elda and sissvoc releases have been downloaded and unpacked as per the package-sissvoc-vanilla.sh script.
## This script allows users to modify/add/configure files to the elda/sissvoc releases and package into sissvoc.war
set -x #echo on
cd sissvoc-vanilla
cd build
#build default and pizza sissvoc configs
#cp ../../configs/pizza-config.properties ../../configs/default-config.properties  .
rm *.ttl
for file in ../../configs/*.properties
do 
	filename=$(basename "$file")
	extension="${filename##*.}"
	filename="${filename%.*}"
	python gen_sissvoc3_config.py --config=$file $filename.ttl
done
cd ../..
#create sissvoc package and output war file for application server
mkdir sissvoc-pkg
cd sissvoc-pkg
cp -rf ../elda/elda-common/target/elda-common/* .
cp -rf ../elda/elda-assets/target/elda-assets lda-assets
cp -rf ../sissvoc-vanilla/resources/ ../sissvoc-vanilla/default-landing/ .
rm resources/default/config/*
cp ../sissvoc-vanilla/build/*.ttl resources/default/config
sed -i "s/<param-value>\/etc\/elda\/conf.d\/{APP}\/\*.ttl<\/param-value>/<param-value>resources\/default\/config\/\*.ttl<\/param-value>/g" WEB-INF/web.xml
jar -cvf sissvoc.war *
mv sissvoc.war ..
