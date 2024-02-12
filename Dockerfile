# Use an official Maven image as a base
FROM maven:3.8.4-openjdk-8 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy SSL certificates
COPY ssl-certificates/fullchain.pem /app/fullchain.pem
COPY ssl-certificates/privkey.pem /app/privkey.pem

# Copy the project files into the container
COPY . .

# Expose the port that the application will run on
EXPOSE 8084

# Command to run the application using mvn spring-boot:run
CMD ["mvn", "spring-boot:run"]