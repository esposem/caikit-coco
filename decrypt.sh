#!/bin/bash

# export PLAIN_TEXT_MODEL="pytorch_model.bin"
# export ENCRYPTED_MODEL="pytorch_model.bin.enc"
# export KEY_FILE="key.bin"

openssl enc \
-d -aes-256-cbc -md sha512 -pbkdf2 -iter 250000 -salt \
-in "${ENCRYPTED_MODEL}" \
-out decryptedmodel.txt \
-pass file:"${KEY_FILE}"