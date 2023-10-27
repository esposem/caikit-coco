FROM quay.io/opendatahub/modelmesh-minio-examples:caikit-flan-t5

WORKDIR /data1/modelmesh-example-models/llm/models/flan-t5-small-caikit/artifacts/

ADD fenc /bin

RUN /bin/curl -o key.bin https://people.redhat.com/eesposit/key.bin && /bin/fenc -file pytorch_model.bin -key key.bin -operation encryption && rm key.bin

RUN rm pytorch_model.bin