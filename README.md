SISSVoc-package ![alt text](http://i.imgur.com/llD3KFb.jpg "CSIRO")
===============
Author: Jonathan Yu (CSIRO) 

Updated: 8/12/2014


Packaging scripts for sissvoc.The packaging script currently targets a vanilla release of SISSVoc and ELDA 1.2.35.

See: 
- https://github.com/jyucsiro/sissvoc
- https://github.com/SISS/sissvoc
- https://github.com/epimorphics/elda

# What is SISSVoc used for?

**SISSVoc provides a user-friendly web interface to a vocabulary already available from a SPARQL endpoint.**

Prior to SISSVoc standard RDF database users had to interact with RDF data by using SPARQL queries. Ask yourself; today how many standard database users access information from a database using SQL? Not many. Even using an atm would be a difficult task if you have never had experience with SQL.

This is where SISSVoc comes in to play. It creates, for the standard vocabulary user, an appropriate interface which is based on the structure of vocabulary data, not generic RDF queries. This means that standard vocabularies can be provided to web users.

While it provided this pleasant interface for humans the main aim was focused on machine-machine RDF database interaction. This is so that data providers can use HTTP links to vocabularies, data applications can be configured with standard terminology, and data clients can retrieve definitions or verify the existence of items claimed to be in particular vocabularies.

## Major Assumptions of SISSVoc

It is assumed that:

- existing vocabularies can be expressed in SKOS/RDF 
- the main use-case involve read-only interaction with vocabularies 
- vocabulary owners may not be willing or able to host their vocabularies, so vocabularies may be hosted by third parties 


Linux Quick-start
-----------------

#### Pre-requisites:
* git
* maven
* python 2.7+
* bash
* sed
* openjdk-7

#### Steps:
1. Unzip `sissvoc-package-master.zip` 
   * Use unzip command from command line: `unzip sissvoc-package-master.zip` when in the correct directory or unzip from file explorer.
2. Navigate to the `sissvoc-package` repo directory.
   * Navigate through the command line: `cd sissvoc-package-master/` if you just used the unzip command, until you are in the extracted file.
   * Sanity check: the ls command in the command line `account@account:~/Downloads/sissvoc-package-master$ ls`should return (Note* some directories or shell scripts may be missing until after running pachage-sissvoc-vanilla.sh)
![alt text](http://i.imgur.com/EIYnvfK.png "output")

3. Run `./package-sissvoc-vanilla.sh`
   * Use the following command from the command line: `bash package-sissvoc-vanilla.sh`
4. This should produce and package up sissvoc into `sissvoc.war` which you can deploy in an Application Server such as Tomcat7 or with **jetty-runner** (instructions below).


Windows Quick-start
-------------------

#### Pre-requisites
* Git for Windows (recommend 1.9+ ; [download here](http://git-scm.com/download/win))
* Maven (recommend 3.2+; [download here](http://maven.apache.org/download.cgi))
* JDK 1.7+ (recommend [Sun JDK](see http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html))
* python 2.7+


#### Notes (Must be done before Steps):
- Git for Windows will include Bash for Windows. Ensure the Git bin is added to the Windows environment PATH (e.g. by going to Control Panel/System and Security/System/Advanced system settings).
- Ensure Maven bin dir is  added to the Windows environment PATH
- Ensure JDK 1.7 bin dir is added to the Windows environment PATH. Additionally, ensure JAVA_HOME is defined as a Windows environment variable and pointed to the JDK dir.

##### How to add a bin dir to the Windows environment PATH
1. Once in the Advanced system settings (Control Panel/System and Security/System/Advanced system settings), select `Environment Variables..`.
2. Then under System variables, find the variable “PATH” and click edit.  You will be displayed with this screen:
![alt text](http://i.imgur.com/7eBt9iV.png "Example of adding the Git bin to the PATH variable")
3. In the variable value add a semicolon on the end of what is already there (;) and then add a bin directory (e.g `C:\Program Files (x86)\Git\bin`) on to the end and click ok. For each bin you must add a new semicolon and then add the bin path/location after it. Do this for Maven, Git and JDK 1.7.  (If there is no PATH variable then you may create a new one omitting the semicolon for the first bin)
4. The steps to ensure JAVA_HOME is defined as a Windows environment variable and pointed to the JDK dir are very similar. All that is different is that you may have to create a new environmental variable name "JAVA_HOME" and for the variable value add in the location of the JDK dir (e.g `C:\Program Files\Java\jdk1.8.0_25\`).

#### Steps:
1. Navigate to the `sissvoc-package` repo directory.
  * Using the `cmd` (access by win key + r and enter cmd, click enter) use `cd **location of your file** \sissvoc-package-master`  ![alt text](http://i.imgur.com/XDJ8ZmK.png "an example")
2. Execute `package-sissvoc-vanilla.bat` 
  * Click tab until `package-sissvoc-vanilla.bat` is displayed and click enter.
  * It will take some time and if successful will display this:![alt text](http://i.imgur.com/dRpO9SW.png "success")
3. This should produce and package up sissvoc into `sissvoc.war` which you can deploy in an Application Server such as Tomcat7.


Running sissvoc via jetty-runner
--------------------------------

Included in this repo is the jetty-runner. This can be used to run the packaged SISSVoc locally. 

#### Pre-requisites:
* Java 1.7+

#### To run sissvoc locally

Linux
```
   $ java -jar jar/jetty-runner.jar --path /sissvoc sissvoc.war
```   
Windows (for convenience we've written sissvoc-runner.bat)
```
   $ java -jar jar\jetty-runner.jar --path /sissvoc sissvoc.war
```   
   
Then navigate to http://localhost:8080/sissvoc/meta/api for the list of endpoints available.

For more information on jetty-runner, see http://www.eclipse.org/jetty/documentation/current/runner.html






