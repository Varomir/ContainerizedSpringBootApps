# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
RUN apk add --no-cache bash
# copy WAR into image
COPY target/containerized-spring-boot-apps-0.1.1.war /app.war
COPY src/main/resources/logback.xml /logback.xml
COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
