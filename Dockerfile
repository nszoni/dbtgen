FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

COPY requirements.txt .
COPY dbtgen.json .

# install PDM
RUN pip install -U pip setuptools wheel
RUN pip install -r requirements.txt

ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid "$USER_GID" vscode && usermod --uid "$USER_UID" --gid "$USER_GID" vscode; fi
USER vscode
