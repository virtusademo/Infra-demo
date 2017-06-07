FROM debian:jessie
RUN apt-get update && apt-get install -y wget
RUN cd /opt && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz" && \
    tar xzf jdk-8u131-linux-x64.tar.gz && \
    wget http://www.eu.apache.org/dist/tomcat/tomcat-7/v7.0.78/bin/apache-tomcat-7.0.78.tar.gz && \
     tar zxpvf apache-tomcat-7.0.78.tar.gz
ENV JAVA_HOME /opt/jdk1.8.0_131
ENV CATALINA_HOME /opt/apache-tomcat-7.0.78
ENV PATH $PATH:$JAVA_HOME/bin
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin
ADD ./run.sh /usr/local/bin/run
EXPOSE 8080
RUN chmod +x /usr/local/bin/run
ENTRYPOINT ["/usr/local/bin/run"]
COPY AngularJSRestful-0.0.1-SNAPSHOT.war /opt/apache-tomcat-7.0.78/webapps
RUN cd /opt/apache-tomcat-7.0.78/webapps && mv AngularJSRestful-0.0.1-SNAPSHOT.war app.war
