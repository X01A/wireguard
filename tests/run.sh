#!/bin/bash
set -e

sudo add-apt-repository ppa:wireguard/wireguard -y
sudo apt-get update -y
sudo apt-get install wireguard-dkms wireguard-tools linux-headers-$(uname -r) -y

export ROLE_NAME="wireguard"

docker run \
    --rm --privileged \
    -v /lib/modules/:/lib/modules/ \
    -v $(pwd):/etc/ansible/roles/$ROLE_NAME/ \
    indexyz/ansible:$1 \
    -i /etc/ansible/roles/$ROLE_NAME/tests/inventory \
    /etc/ansible/roles/$ROLE_NAME/tests/test.yml -vvv

