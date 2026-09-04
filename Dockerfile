FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY src/main/webapp /usr/local/tomcat/webapps/foodif

RUN mkdir -p /usr/local/tomcat/webapps/foodif/WEB-INF/classes

COPY src/main/java /tmp/java-src

RUN javac \
    -cp "/usr/local/tomcat/lib/*:/usr/local/tomcat/webapps/foodif/WEB-INF/lib/*" \
    -d /usr/local/tomcat/webapps/foodif/WEB-INF/classes \
    $(find /tmp/java-src -name "*.java")

EXPOSE 8080

CMD ["catalina.sh", "run"]