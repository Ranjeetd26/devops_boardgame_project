
FROM maven:3.8.4-openjdk-11-slim AS build-stage 
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY ./src /app/src
RUN mvn package
# RUN mkdir -p $APP_HOME

# WORKDIR $APP_HOME

# COPY target/*.jar $APP_HOME/app.jar
FROM openjdk:17-alpine
COPY --from=build-stage /app/target/*.jar app.jar
EXPOSE 8080

CMD ["java", "-jar", "app.jar"]