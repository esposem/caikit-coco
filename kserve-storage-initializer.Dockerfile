FROM quay.io/modh/kserve-storage-initializer@sha256:d5ded56dfe3fb1c927e18dfff9a8507c97fbb34572a57e4db14a7a94a417082c

USER 0

WORKDIR /storage-initializer/scripts

RUN mv initializer-entrypoint initializer-entrypoint-origin

COPY initializer-entrypoint.py ./initializer-entrypoint

RUN chmod +x initializer-entrypoint