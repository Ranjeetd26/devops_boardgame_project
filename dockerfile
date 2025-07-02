# Stage 1: Build with Maven
FROM maven:3.8.4-openjdk-17-slim AS build-stage
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Run the built JAR
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build-stage /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
