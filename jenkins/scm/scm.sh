#!/bin/bash

# copying the latest code of "spring-petclinic" repo

git clone https://github.com/spring-projects/spring-petclinic.git

echo "***************************"
echo "** Building jar ***********"
echo "***************************"

 WORKSPACE=/var/jenkins_home/workspace/petclinic-pipeline

 docker run --rm  -v  $WORKSPACE/spring-petclinic:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"