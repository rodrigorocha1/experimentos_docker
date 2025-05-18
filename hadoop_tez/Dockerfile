FROM apache/hadoop:3.3.6

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip wget && \
    rm -rf /var/lib/apt/lists/*

ENV TEZ_VERSION=0.10.2

RUN wget https://downloads.apache.org/tez/${TEZ_VERSION}/apache-tez-${TEZ_VERSION}-bin.tar.gz && \
    tar -xzf apache-tez-${TEZ_VERSION}-bin.tar.gz -C /opt/ && \
    rm apache-tez-${TEZ_VERSION}-bin.tar.gz && \
    ln -s /opt/apache-tez-${TEZ_VERSION}-bin /opt/tez

ENV TEZ_HOME=/opt/tez
ENV PATH=$PATH:$TEZ_HOME/bin

COPY start-tez-ui.sh /start-tez-ui.sh
RUN chmod +x /start-tez-ui.sh

CMD ["/start-tez-ui.sh"]
