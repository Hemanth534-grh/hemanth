FROM alpine
LABEL author="Dockerfile"
WORKDIR /javahome
RUN apk add openjdk8
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.109/bin/apache-tomcat-9.0.109.tar.gz .
RUN tar -xvf apache-tomcat-9.0.109.tar.gz
RUN mv apache-tomcat-9.0.109 tomcat9
COPY target/*.war /javahome/tomcat9/webapps

EXPOSE 8080
CMD ["/javahome/tomcat9/bin/catalina.sh", "run"]
