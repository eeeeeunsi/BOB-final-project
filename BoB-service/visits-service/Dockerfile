FROM adoptopenjdk:11-jdk-hotspot
# ARG ARTIFACT_NAME
ARG EXPOSED_PORT

ADD target/spring-petclinic-visits-service-1.0.0.RELEASE.jar /usr/share/app.jar

EXPOSE ${EXPOSED_PORT}
# ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XshowSettings:vm", "-Djava.security.egd=file:/dev/./urandom","-jar","/usr/share/app.jar"]
ENTRYPOINT exec java $JAVA_OPTS  -jar /usr/share/app.jar
