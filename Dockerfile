FROM tomcat:10.1-jdk17
COPY . /usr/local/tomcat/webapps/New_Web_Project
EXPOSE 8080
CMD ["catalina.sh", "run"]
