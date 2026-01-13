FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Adiciona repositório antigo do Bionic para instalar libwebkitgtk-1.0-0
RUN echo "deb [trusted=yes] http://cz.archive.ubuntu.com/ubuntu bionic main universe" >> /etc/apt/sources.list

# Atualiza pacotes e instala Java 8 + wget + unzip + libwebkitgtk
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk wget unzip libwebkitgtk-1.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Baixa Pentaho Data Integration 8.3
RUN wget https://sourceforge.net/projects/pentaho/files/Data%20Integration/8.3/pdi-ce-8.3.0.0-371.zip/download -O /tmp/pdi.zip && \
    unzip /tmp/pdi.zip -d /opt && \
    rm /tmp/pdi.zip

WORKDIR /opt/data-integration

VOLUME /data
EXPOSE 8000

CMD ["sh", "carte.sh", "-H", "0.0.0.0", "-p", "8000"]
