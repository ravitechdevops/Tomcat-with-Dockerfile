# Use a minimal image as parent
FROM openjdk:18-ea-11-alpine

# Environment variables
ENV TOMCAT_MAJOR=10 \
    TOMCAT_VERSION=10.0.27 \
<<<<<<< HEAD
    CATALINA_HOME=/opt/tomcat

# init
RUN apk -U upgrade --update && \
	    apk add curl && \
	        apk add ttf-dejavu

RUN mkdir -p /opt

# install tomcat
RUN curl -jkSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
	gunzip /tmp/apache-tomcat.tar.gz && \
	tar -C /opt -xf /tmp/apache-tomcat.tar && \
	ln -s /opt/apache-tomcat-$TOMCAT_VERSION $CATALINA_HOME

# cleanup
RUN apk del curl && \
	rm -rf /tmp/* /var/cache/apk/*

EXPOSE 8080

COPY startup.sh /opt/startup.sh

ENTRYPOINT /opt/startup.sh

=======
        CATALINA_HOME=/opt/tomcat

# init
RUN apk -U upgrade --update && \
    apk add curl && \
    apk add ttf-dejavu
RUN mkdir -p /opt

# install tomcat
RUN curl -jkSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
     gunzip /tmp/apache-tomcat.tar.gz && \
     tar -C /opt -xf /tmp/apache-tomcat.tar && \
     ln -s /opt/apache-tomcat-$TOMCAT_VERSION $CATALINA_HOME

# cleanup
RUN apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

EXPOSE 8080

COPY startup.sh /opt/startup.sh

ENTRYPOINT /opt/startup.sh

>>>>>>> f0cfbf8a0e49fb1f5983417e0a17b1edb691aea1
WORKDIR $CATALINA_HOME
