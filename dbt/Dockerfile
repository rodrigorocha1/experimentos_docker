FROM python:3.10-slim

# Define diretório de trabalho
WORKDIR /usr/app/dbt

# Variáveis de ambiente
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    gcc \
    g++ \
    libpq-dev \
    curl \
    coreutils \
    libkrb5-dev \
    openssh-server \
    vim \
    nano \
    unzip && \
    mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    ssh-keygen -A

# Cria ambiente virtual fora da pasta montada
RUN python -m venv $VIRTUAL_ENV

# Ativa o ambiente virtual por padrão no bash
RUN echo "source $VIRTUAL_ENV/bin/activate" >> /root/.bashrc

# Instala DBT Core + Hive (versões compatíveis)
RUN pip install --upgrade pip wheel && \
    pip install dbt-core dbt-spark dbt-spark[PyHive]


# Copia arquivos do projeto (se necessário)
# COPY . /usr/app/dbt/

# Expõe porta SSH
EXPOSE 22

# Comando padrão: inicia o SSH
CMD ["/usr/sbin/sshd", "-D"]
