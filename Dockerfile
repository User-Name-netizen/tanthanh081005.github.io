<<<<<<< HEAD
FROM tomcat:10.1-jdk21
COPY . /usr/local/tomcat/webapps/ROOT
EXPOSE 8080
CMD ["catalina.sh", "run"]  
=======
FROM tomcat:10.1-jdk17
COPY . /usr/local/tomcat/webapps/ROOT
EXPOSE 8080
CMD ["catalina.sh", "run"]
>>>>>>> c05d3de069bc2da9e98d36751b79489ae5072daa
