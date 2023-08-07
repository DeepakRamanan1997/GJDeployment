# Use the official Tomcat image as the base image
FROM tomcat:9.0

# Remove the default ROOT application from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file to the Tomcat webapps directory
COPY target/addressbook.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat will listen on
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
