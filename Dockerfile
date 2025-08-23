FROM tomcat:10.1-jdk22
COPY . /usr/local/tomcat/webapps/email-list-website
EXPOSE 8080
CMD ["catalina.sh", "run"]
