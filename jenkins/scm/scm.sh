#!/bin/bash

# copying the latest code of "spring-petclinic" repo

git clone https://github.com/spring-projects/spring-petclinic.git

# WORKSPACE=/home/jenkins/jenkins-data/

# docker run --rm  -v  $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"