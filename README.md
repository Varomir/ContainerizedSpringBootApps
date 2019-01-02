# Containerized Spring Boot Application example

Requirements: JDK + Maven, Docker


### Build, deploy and running pure Java application without container

For build without containers:

```mvn clean package```

For run without Docker:

```java -Dspring.profiles.active=default -jar target/containerized-spring-boot-apps-0.1.2.war```

URL:

http://localhost:8081/employees

http://localhost:8081/actuator

### Play with Docker containers.

For build, deploy and run with Docker container:

```docker build -t containerized-spring-boot-apps:latest .```

```docker image ls```

```docker run -d -p 8080:8081 containerized-spring-boot-apps:latest```

```docker ps -a```

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

 Go to the: http://localhost:8080/actuator/health

 ```cat /private/var/tmp/application.log```

 ### Passing arguments to the container

 Add ENTRYPOINT, rebuild:

 ```docker build -t containerized-spring-boot-apps:latest .```

 Run with 'dev' argument:

 ```docker run -d --name bootapp -v /private/var/tmp:/tmp/ -p 8080:8081 containerized-spring-boot-apps:latest dev```

 Check the applied 'spring.profiles.active':

 ```grep profiles /private/var/tmp/application.log``` ==> ```... The following profiles are active: dev```
