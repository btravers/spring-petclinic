FROM tomcat:8.0

MAINTAINER Benoit TRAVERS <benoit.travers@zenika.com>

RUN rm -rf $CATALINA_HOME/webapps/ROOT

ADD target/petclinic.war $CATALINA_HOME/webapps/ROOT.war

RUN echo 'CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9991 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"' > $CATALINA_HOME/bin/setenv.sh

ENTRYPOINT ["catalina.sh", "run"]
