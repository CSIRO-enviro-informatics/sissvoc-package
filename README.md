SISSVoc-package ![alt text](http://i.imgur.com/llD3KFb.jpg "CSIRO")
===============

Packaging scripts for sissvoc. This package includes docker scripts for streamlined deployment of SISSVoc. The packaging script currently targets a vanilla release of SISSVoc and ELDA 1.3.4.

Pre-requisite:
--------------
- Docker v1.4+
- Linux OS

See: 
- https://github.com/jyucsiro/sissvoc
- https://github.com/SISS/sissvoc
- https://github.com/epimorphics/elda

[![Youtube tutorial](http://img.youtube.com/vi/ryfWCA0JNY0/0.jpg)](http://www.youtube.com/watch?v=ryfWCA0JNY0)



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
* docker 

#### Steps:
1. docker build -t sissvoc .
2. docker run -P -d sissvoc 
3. docker ps (find port mapped to 8080)
3. navigate to localhost:[mapped port]/sissvoc/meta/api

