FROM tomcat:10.1-jdk17-temurin

# Remove default Tomcat ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Deploy FoodNinja as the ROOT application
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# Create classes directory
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Copy Java source
COPY src/main/java/ /tmp/java-src/

# Compile Java source
RUN javac \
    -cp "/usr/local/tomcat/lib/*:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    $(find /tmp/java-src -name "*.java")

# Verify files
RUN echo "===== FOODNINJA ROOT WEBAPP =====" && \
    find /usr/local/tomcat/webapps/ROOT -maxdepth 3 -type f | sort

EXPOSE 8080

CMD ["catalina.sh", "run"]