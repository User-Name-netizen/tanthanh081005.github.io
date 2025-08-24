FROM tomcat:10.1-jdk21

# Tạo thư mục WEB-INF/classes nếu chưa có
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Sao chép các tệp tĩnh và JSP
COPY index.html main.css thanks.jsp /usr/local/tomcat/webapps/ROOT/

# Sao chép web.xml
COPY web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/

# Sao chép các tệp đã biên dịch (cần có sẵn trong thư mục local)
COPY murach /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/murach

EXPOSE 8080
CMD ["catalina.sh", "run"]
