#!/bin/bash
docker build -t registry.scontain.com:5050/sconecuratedimages/iexecsgx:hello-world-java-8 .
docker push registry.scontain.com:5050/sconecuratedimages/iexecsgx:hello-world-java-8