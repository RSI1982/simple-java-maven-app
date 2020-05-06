#docker build -t saravak/tomcat8 .

#Sending build context to Docker daemon   38.4kB
FROM centos
MAINTAINER aksarav@middlewareinventory.com
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -o tomcat9.tar.gz http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar -xvf tomcat9.tar.gz
RUN mv apache-tomcat-9.0.30/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
WORKDIR /opt/tomcat/webapps
RUN curl -O http://192.168.0.107:8081/repository/mavenapp-pipeline/maven-central/mavenapp-pipeline/${BUILD_NUMBER}/
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "runt"]
