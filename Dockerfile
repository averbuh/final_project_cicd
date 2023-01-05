FROM openjdk:11
LABEL version="0.0.1"
COPY app/order-service/target/order-service-1.0-SNAPSHOT.jar /home/app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]

