FROM oraclelinux:10-slim

ARG USERNAME=oracle
ARG PASSWORD=oracle123

RUN microdnf install -y shadow-utils passwd \
    && useradd -m ${USERNAME} \
    && echo "${USERNAME}:${PASSWORD}" | chpasswd \
    && microdnf clean all

USER ${USERNAME}
WORKDIR /home/${USERNAME}

CMD ["/bin/bash"]

