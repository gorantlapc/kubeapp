# Stage 1: Build the application
# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-17-slim AS build
# Set the working directory in the container
WORKDIR /kubeapp
# copy project files to the container
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create a minimal runtime image
FROM eclipse-temurin:17-jre AS runtime
WORKDIR /kubeapp
# Copy the built JAR file from the previous stage to the container
COPY --from=build /kubeapp/target/kubeapp-3.4.2.jar kubeapp.jar
# Set the command to run the application
ENTRYPOINT ["java", "-jar", "kubeapp.jar"]