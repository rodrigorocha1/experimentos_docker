#!/bin/bash
echo "Iniciando Tez UI History Server..."
cd $TEZ_HOME
python3 tez-ui --host 0.0.0.0 --port 9999
