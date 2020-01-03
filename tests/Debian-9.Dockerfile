FROM debian:stretch

COPY . /etc/ansible/roles/wireguard

WORKDIR /etc/ansible

RUN apt-get update -y && \
    apt-get install ansible -y && \
    ansible-playbook /etc/ansible/roles/wireguard/tests/test.yml


