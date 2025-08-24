# Sử dụng image Tomcat cơ sở với JDK 21
FROM tomcat:10.1-jdk21

# Chuyển sang người dùng root để cài đặt phần mềm
USER root

# Cập nhật danh sách gói và cài đặt các công cụ cần thiết để thêm kho lưu trữ (repository) mới
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg2 \
    dirmngr \
    software-properties-common

# Thêm kho lưu trữ Adoptium và cài đặt Temurin (OpenJDK) 22
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null \
    && add-apt-repository --yes https://packages.adoptium.net/artifactory/deb/ \
    && apt-get update \
    && apt-get install -y --no-install-recommends temurin-22-jdk

# Đặt biến môi trường JAVA_HOME và PATH để trỏ đến JDK 22
ENV JAVA_HOME=/usr/lib/jvm/temurin-22-jdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Chuyển trở lại người dùng tomcat để chạy ứng dụng
USER tomcat

# Sao chép các tệp của bạn vào thư mục webapps của Tomcat
COPY . /usr/local/tomcat/webapps/ROOT

# Mở cổng 8080
EXPOSE 8080

# Lệnh để chạy Tomcat
CMD ["catalina.sh", "run"]
