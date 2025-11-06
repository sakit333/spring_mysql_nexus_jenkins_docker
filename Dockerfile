################################################################################
#  Multi-Stage Dockerfile for Spring Boot Application with Nexus Deployment
#  Designed and Developed by: @sak_shetty
#
#  Stage 1: Build & deploy JAR to Nexus
#  Stage 2: Create lightweight runtime image with OpenJDK 17
################################################################################

#### ---- Stage 1: Build & Deploy ---- ####
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
COPY settings.xml /root/.m2/settings.xml
RUN mvn clean package -DskipTests deploy -s /root/.m2/settings.xml

#### ---- Stage 2: Runtime ---- ####
FROM openjdk:17-jdk-slim AS runtime
LABEL maintainer="sak_shetty" \
      description="Spring Boot App built and designed by sak_shetty"
WORKDIR /app
COPY --from=build /app/target/spring_app_sak-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "app.jar"]
