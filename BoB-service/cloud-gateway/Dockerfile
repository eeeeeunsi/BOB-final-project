FROM adoptopenjdk:11-jdk-hotspot

ARG EXPOSED_PORT=80

ADD target/spring-petclinic-cloud-gateway-1.0.0.RELEASE.jar /usr/share/app.jar

EXPOSE ${EXPOSED_PORT}

# For Java 11, you don't need the -XX:+UnlockExperimentalVMOptions and -XX:+UseCGroupMemoryLimitForHeap options.
ENTRYPOINT exec java $JAVA_OPTS -jar /usr/share/app.jar