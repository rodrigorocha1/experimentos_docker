FROM python:3.10-slim

WORKDIR /usr/app/dbt

ENV VIRTUAL_ENV=/usr/app/dbt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    gcc \
    g++ \
    libpq-dev \
    curl \
    coreutils \
    libkrb5-dev \
    openssh-server && \
    mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    ssh-keygen -A

RUN python -m venv $VIRTUAL_ENV

# Corrige o .bashrc para ativar o virtualenv correto
RUN echo "source $VIRTUAL_ENV/bin/activate" >> /root/.bashrc

RUN pip install --upgrade pip wheel && \
    pip install dbt-core dbt-hive

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
