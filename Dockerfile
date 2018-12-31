# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
# copy WAR into image
COPY target/containerized-spring-boot-apps-0.1.1.war /app.war
COPY src/main/resources/logback.xml /logback.xml
# run application with this command line
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "-Dlogging.config=/logback.xml", "/app.war"]
