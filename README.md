# Containerized Spring Boot Application example

Requirements: JDK + Maven, Docker


For build without containers:

```
mvn clean package
```

For run without Docker:

```
java -Dspring.profiles.active=default -jar target/containerized-spring-boot-apps-0.1.1.war
```

URL:

http://localhost:8081/employees

http://localhost:8081/actuator


For build, deploy and run with Docker container

```docker build -t containerized-spring-boot-apps:latest .```
```docker image ls```
```
docker run -d -p 8080:8081 containerized-spring-boot-apps:latest
```
```docker ps```

Check URL: http://localhost:8080/employees

 * Note: the port was changed, where '8080' is the Host machine port and '8081' port inside containerized application.

To get the container logs:
```docker logs {CONTAINER_ID}```

For stop your containerized application:
```docker kill {CONTAINER_ID}```

### Save data outside of the container

```docker run -d -v /private/var/tmp:/tmp/ -p 8080:8081 containerized-spring-boot-apps:latest```

 * Note: The original LOG-file path '/tmp/application.log' marks the file path 'inside' the docker container.
 And then we 'map' the container directory with the host machine directory.

 In this particular case, prepared for Mac OS:
 [container] '/tmp/' => [host machine] '/private/var/tmp'
