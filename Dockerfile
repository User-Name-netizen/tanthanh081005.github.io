FROM tomcat:9.0-jdk11
COPY webapp /usr/local/tomcat/webapps/email-list-webapp
EXPOSE 8080
CMD ["catalina.sh", "run"]