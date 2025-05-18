FROM apache/airflow:2.10.5

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

USER airflow

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./dags /opt/airflow/dags
# COPY ./plugins /opt/airflow/plugins