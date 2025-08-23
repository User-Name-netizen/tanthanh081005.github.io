FROM tomcat:10.1-jdk17
COPY . /usr/local/tomcat/webapps/email-list-website
EXPOSE 8080
CMD ["catalina.sh", "run"]
