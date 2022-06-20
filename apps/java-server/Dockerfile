FROM openjdk:17-alpine

RUN mkdir /app
WORKDIR /app
COPY target/java-server-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT java -jar /app/app.jar
