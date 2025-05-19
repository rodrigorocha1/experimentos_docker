FROM apache/hive:4.0.0

USER root

RUN apt-get update && apt-get install -y wget && \
    wget -O /opt/hive/lib/mysql-connector-java.jar https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar

USER hive