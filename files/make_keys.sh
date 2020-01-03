#!/bin/bash
FACTS_DIR='/etc/ansible/facts.d'
FACT_FILE="${FACTS_DIR}/wireguard.fact"
KEYS_DIR='/etc/wireguard/keys'

function file_content {
  if [ ! -d "$KEYS_DIR" ]; then
    mkdir -p $KEYS_DIR
    cd $KEYS_DIR
    # Make keys
    wg genkey | tee privatekey | wg pubkey > publickey
  fi
  echo "{"
  echo "  \"private_key\": \"`cat $KEYS_DIR/privatekey`\","
  echo "  \"public_key\": \"`cat $KEYS_DIR/publickey`\""
  echo "}"
}

if [ ! -d "$FACTS_DIR" ]; then
  mkdir -p $FACTS_DIR
fi

file_content > $FACT_FILE
