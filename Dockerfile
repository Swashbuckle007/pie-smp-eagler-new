# Use an appropriate base image with Java installed
# Java 17 is recommended for modern BungeeCord/Waterfall versions
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy all your BungeeCord files (config.yml, plugins, etc.) into the container
COPY . /app

# Expose the default BungeeCord port (25577 is a common alternative to 25565)
# Note: BungeeCord's default port in config.yml is often 25577, but your main external port on Render will be 25565
EXPOSE 25577

# Define the command to run your BungeeCord server
# Adjust BungeeCord.jar to your actual JAR file name
# Adjust RAM allocation as needed (BungeeCord needs less than backend servers, often 512M to 1G)
CMD ["java", "-Xms512M", "-Xmx1G", "-jar", "BungeeCord.jar"]
