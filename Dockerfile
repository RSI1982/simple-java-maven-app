#docker build -t saravak/tomcat8 .

#Sending build context to Docker daemon   38.4kB
FROM centos
MAINTAINER aksarav@middlewareinventory.com
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
WORKDIR /opt/tomcat/webapps
RUN curl -O http://192.168.0.12:8081/repository/mavenapp-pipeline/maven-central/mavenapp-pipeline/${BUILD_NUMBER}
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "runt"]
