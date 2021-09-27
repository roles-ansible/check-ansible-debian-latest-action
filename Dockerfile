FROM debian:latest

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-debian-latest-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-debian-latest-action"

LABEL "com.github.actions.name"="check-ansible-debian-latest"
LABEL "com.github.actions.description"="Check ansible role or playbook with Debian latest"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    python3-pip \
    git \
    systemd \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && pip3 install --no-cache-dir setuptools \
      && pip3 install --no-cache-dir ansible \
      && ansible --version

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
