From ubuntu:18.04

# installing Dependencies

RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common unzip tar

# installing JAVA

RUN apt-get update && \
    apt-get install openjdk-11-jdk -y

# Setting JAVA_HOME 
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/

#Downloading tomcat
RUN mkdir /usr/local/tomcat && \
    cd /usr/local/tomcat && \
    wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz && \
    tar xvfz apache-tomcat-8.5.65.tar.gz

#Tomcat - Roles and User configuration
ADD tomcat-users.xml /usr/local/tomcat/apache-tomcat-8.5.65/conf/

#Tomcat - Enabling "Host Manager" to run from outside
ADD context.xml /usr/local/tomcat/apache-tomcat-8.5.65/webapps/host-manager/META-INF/

#Tomcat - Enabling "Manager App" to run from outside
ADD context.xml /usr/local/tomcat/apache-tomcat-8.5.65/webapps/manager/META-INF/

#Tomcat - Deploying Web Application 
ADD webapp6.war /usr/local/tomcat/apache-tomcat-8.5.65/webapps/

#Exposing Container Port to Host
EXPOSE 8080

#Tomcat - Launch
CMD /usr/local/tomcat/apache-tomcat-8.5.65/bin/catalina.sh run
#CMD /usr/local/tomcat/apache-tomcat-8.5.65/bin/startup.sh
