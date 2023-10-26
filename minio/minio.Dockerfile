FROM quay.io/opendatahub/modelmesh-minio-examples:caikit-flan-t5

WORKDIR /data1/modelmesh-example-models/llm/models/flan-t5-small-caikit/artifacts/

RUN /bin/curl -o key.bin https://people.redhat.com/eesposit/key.bin

ENV PLAIN_TEXT_MODEL="pytorch_model.bin" \
	ENCRYPTED_MODEL="pytorch_model.bin.enc" \
	KEY_FILE="key.bin"

RUN openssl enc \
	-aes-256-cbc -md sha512 -pbkdf2 -iter 250000 -salt \
	-in "${PLAIN_TEXT_MODEL}" \
	-out "${ENCRYPTED_MODEL}" \
	-pass file:"${KEY_FILE}"

# RUN mv pytorch_model.bin original_pytorch_model.bin

RUN rm key.bin