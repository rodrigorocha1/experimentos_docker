#!/bin/bash

export JAVA_HOME=/usr/local/openjdk-8
export PATH=$JAVA_HOME/bin:$PATH
# Inicia o SSH
sudo service ssh start

# Formata o HDFS apenas uma vez
if [ ! -f /home/hadoop/.hdfs_formatted ]; then
    echo "==> Formatando o HDFS..."
    $HADOOP_HOME/bin/hdfs namenode -format -force
    touch /home/hadoop/.hdfs_formatted
else
    echo "==> HDFS já formatado. Pulando formatação."
fi

# Inicia o HDFS e o YARN
echo "==> Iniciando o HDFS..."
$HADOOP_HOME/sbin/start-dfs.sh

echo "==> Iniciando o YARN..."
$HADOOP_HOME/sbin/start-yarn.sh

# Mostra os processos Hadoop (opcional)
jps

# Mantém o container ativo
exec /bin/bash