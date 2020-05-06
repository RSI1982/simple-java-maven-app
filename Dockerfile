$ docker build -t saravak/tomcat8 .

Sending build context to Docker daemon   38.4kB
Step 1/13 : FROM centos
 ---> 1e1148e4cc2c
Step 2/13 : MAINTAINER aksarav@middlewareinventory.com
 ---> Using cache
 ---> af1217ce46de
Step 3/13 : RUN mkdir /opt/tomcat/
 ---> Using cache
 ---> 4c38afae9d54
Step 4/13 : WORKDIR /opt/tomcat
 ---> Using cache
 ---> a725d7431b50
Step 5/13 : RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
 ---> Using cache
 ---> 91e7bc7726ff
Step 6/13 : RUN tar xvfz apache*.tar.gz
 ---> Using cache
 ---> 629328c4f4d2
Step 7/13 : RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
 ---> Using cache
 ---> f501f3c72f61
Step 8/13 : RUN yum -y install java
 ---> Using cache
 ---> 345972c4e662
Step 9/13 : RUN java -version
 ---> Using cache
 ---> ccb7b9f52541
Step 10/13 : WORKDIR /opt/tomcat/webapps
 ---> Running in 83e328f92c1a
Removing intermediate container 83e328f92c1a
 ---> 8e8d29c51fd8
Step 11/13 : RUN curl -O https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
 ---> Running in cdc45a9204a9
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   149  100   149    0     0     66      0  0:00:02  0:00:02 --:--:--    66
FROM centos
Removing intermediate container cdc45a9204a9
 ---> b064cd141999
Step 12/13 : EXPOSE 8080
 ---> Running in dd17c8c97189
Removing intermediate container dd17c8c97189
 ---> cc5acb3cb1f8
Step 13/13 : CMD ["/opt/tomcat/bin/catalina.sh", "runt"]
 ---> Running in f8bf12a4e567
Removing intermediate container f8bf12a4e567
 ---> 2b61f132794e
Successfully built 2b61f132794e
Successfully tagged saravak/tomcat8:latest
