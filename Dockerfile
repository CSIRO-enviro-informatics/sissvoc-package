FROM consol/tomcat-8.0
ADD . /sissvoc-package
RUN apt-get install -y zip curl 
WORKDIR /sissvoc-package
RUN curl -L -O https://github.com/jyucsiro/sissvoc/archive/sissvoc-vanilla-v0.2.zip
RUN unzip sissvoc-vanilla-v0.2.zip
RUN mv sissvoc-sissvoc-vanilla-v0.2 sissvoc-vanilla
RUN mkdir -p elda
RUN mkdir -p elda/elda-assets/target/
RUN mkdir -p elda/elda-common/target/
RUN unzip elda-assets.zip -d elda/elda-assets/target/
RUN unzip elda-common.zip -d elda/elda-common/target/
RUN mkdir -p sissvoc-vanilla/configs
RUN cp configs/*.properties sissvoc-vanilla/configs
RUN ./package-sissvoc-vanilla--no-build.sh
RUN mkdir /maven
RUN cp ./sissvoc.war /maven
