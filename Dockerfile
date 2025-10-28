# Use official Tomcat base image with JDK 11
FROM tomcat:9-jdk11

# Labels for documentation and DockerHub metadata
LABEL maintainer="shiva@gmail.com"
LABEL description="Pega Platform Demo Docker image with Tomcat 9 + JDK 11"

# Set Tomcat home directory
ENV CATALINA_HOME=/usr/local/tomcat

# Optional: Tune JVM heap for better performance (adjust if needed)
ENV JAVA_OPTS="-Xms512m -Xmx1024m"

# Copy your Pega (demo) WAR file into Tomcat's webapps directory
COPY pega.war $CATALINA_HOME/webapps/pega.war

# Expose Tomcat default HTTP port
EXPOSE 8080

# Start Tomcat server in the foreground
CMD ["catalina.sh", "run"]
