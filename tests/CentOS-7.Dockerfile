FROM centos:7

RUN yum install python-pip -y && \
    pip install ansible

ENTRYPOINT [ "ansible-playbook" ]
CMD [ "/etc/ansible/roles/wireguard/tests/test.yml" ]