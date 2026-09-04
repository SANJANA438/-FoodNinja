FROM tomcat:10.1-jdk17-temurin

# Remove default Tomcat ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy web application
COPY src/main/webapp/ /usr/local/tomcat/webapps/foodif/

# Create classes directory
RUN mkdir -p /usr/local/tomcat/webapps/foodif/WEB-INF/classes

# Copy Java source
COPY src/main/java/ /tmp/java-src/

# Compile Java source
RUN javac \
    -cp "/usr/local/tomcat/lib/*:/usr/local/tomcat/webapps/foodif/WEB-INF/lib/*" \
    -d /usr/local/tomcat/webapps/foodif/WEB-INF/classes \
    $(find /tmp/java-src -name "*.java")

# Verify deployment files exist
RUN echo "===== FOODNINJA WEBAPP =====" && \
    find /usr/local/tomcat/webapps/foodif -maxdepth 3 -type f | sort

EXPOSE 8080

CMD ["catalina.sh", "run"]