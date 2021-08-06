FROM openjdk:8-jdk-alpine
WORKDIR /server
COPY /build/libs/rest-service-0.0.1-SNAPSHOT.jar /server/rest-service-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/server/rest-service-0.0.1-SNAPSHOT.jar"]