FROM quay.io/modh/kserve-storage-initializer@sha256:cc3f0446844577249c0cd08d627a7330b52e39eecd22ae360c784e6c78f1b3f0

USER 0

WORKDIR /storage-initializer/scripts

ADD fenc /bin

RUN mkdir keys && chmod 777 keys

RUN rm initializer-entrypoint

ADD initializer-entrypoint.py ./initializer-entrypoint

RUN chmod +x initializer-entrypoint