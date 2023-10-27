FROM quay.io/modh/kserve-storage-initializer@sha256:d5ded56dfe3fb1c927e18dfff9a8507c97fbb34572a57e4db14a7a94a417082c

USER 0

WORKDIR /storage-initializer/scripts

ADD fenc /bin

RUN mkdir keys && chmod 777 keys

RUN rm initializer-entrypoint

ADD initializer-entrypoint.py ./initializer-entrypoint

RUN chmod +x initializer-entrypoint