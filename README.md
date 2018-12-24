# Containerized Spring Boot Application example

Requirements: JDK + Maven, Docker


For build without containers:

```
mvn clean package
```

For run without Docker:

```
java -Dspring.profiles.active=default -jar target/containerized-spring-boot-apps-0.1.0.war
```

URL:

http://localhost:8081/employees

http://localhost:8081/actuator


For build, deploy and run with Docker container

```
docker build -t containerized-spring-boot-apps:latest .
```
```
docker image ls
```
```
docker run -d -p 8080:8081 containerized-spring-boot-apps:latest
```
```
docker ps
```

Check URL: http://localhost:8080/employees

 * Note: the port was changed, where '8080' is the Host machine port and '8081' port inside containerized application.

For stop your containerized application:
```
docker kill {CONTAINER ID}
```
