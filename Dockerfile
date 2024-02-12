# Use a base image with OpenJDK 8
FROM openjdk:8-jre-slim

# Set the working directory in the container
#WORKDIR /app

# Copy SSL certificates
COPY ssl-certificates/fullchain.pem /app/fullchain.pem
COPY ssl-certificates/privkey.pem /app/privkey.pem

# Copy the JAR file into the container at /app
COPY target/br-spring-boot-crm-with-login-new-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port that the application will run on
EXPOSE 8084

# Set environment variables for SSL
ENV SERVER_SSL_KEY_STORE=/app/fullchain.pem
ENV SERVER_SSL_KEY_STORE_PASSWORD=
ENV SERVER_SSL_KEY_STORE_TYPE=PEM
ENV SERVER_SSL_KEY_ALIAS=tomcat
ENV SERVER_SSL_KEY_PASSWORD=/app/privkey.pem

# Command to run the application
CMD ["java", "-jar", "/app/app.jar", "--server.port=8084"]