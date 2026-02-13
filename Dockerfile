# Stage 1 – build WAR
FROM maven:3.9.9-eclipse-temurin-17 AS builder
WORKDIR /build
LABEL maintainer="Murali Kaspa"
COPY . .
RUN mvn clean package -DskipTests

# Stage 2 – run on Tomcat
FROM tomcat:10.1-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /build/target/portfolio-1.0.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]

