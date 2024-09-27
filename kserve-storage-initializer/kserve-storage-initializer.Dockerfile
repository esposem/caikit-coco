FROM quay.io/modh/kserve-storage-initializer@sha256:48ab81f75a70ef52d0f72b847b11cf1bd654806be0ed368af3c409a0cd0193a8

USER 0

WORKDIR /storage-initializer/scripts

ADD fenc /bin

RUN mkdir keys && chmod 777 keys

RUN rm initializer-entrypoint

ADD initializer-entrypoint.py ./initializer-entrypoint

RUN chmod +x initializer-entrypoint