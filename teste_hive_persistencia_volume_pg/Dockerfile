FROM apache/hive:4.0.0

USER root
RUN apt-get update && apt-get install -y wget && \
    wget -O /opt/hive/lib/postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.6.0.jar

USER hive