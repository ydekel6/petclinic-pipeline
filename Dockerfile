  
#stage 1 - cloning the repo
FROM alpine/git as clone 
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git

#stage  - running SonarQube Scanner
FROM newtmitch/sonar-scanner as scanner
WORKDIR /app
COPY --from=clone app/* ./
RUN sonar-scanner -Dsonar.projectBaseDir=/app

#stage  - building the jar file
FROM openjdk:9-jdk as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app
RUN ./mvnw -B -DskipTests clean package

# stage - deploying the app
FROM openjdk:9-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app

# to change the port of the app, need to change the 
# src/test/jmeter/petclinic_test_plan.jmx
EXPOSE 9010
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar ./*.jar --server.port=9010"]