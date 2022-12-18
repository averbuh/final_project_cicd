FROM maven:3.8.1-openjdk-11-slim
WORKDIR /src
ENTRYPOINT ["mvn"]

