FROM openjdk:17-alpine
 
ENV APP_HOME /usr/src/app

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

COPY target/*.jar $APP_HOME/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]