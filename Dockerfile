FROM tomcat:10.1-jdk17
USER root
RUN apt-get update && apt-get install -y openjdk-22-jdk-headless
ENV JAVA_HOME=/usr/lib/jvm/java-22-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH
USER tomcat
COPY . /usr/local/tomcat/webapps/ROOT
EXPOSE 8080
CMD ["catalina.sh", "run"]
