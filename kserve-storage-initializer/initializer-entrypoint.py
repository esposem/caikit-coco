#!/usr/bin/env python3
import sys
import logging
import subprocess

from kserve.storage import Storage

if len(sys.argv) != 3:
    print("Usage: initializer-entrypoint src_uri dest_path")
    sys.exit()

src_uri = sys.argv[1]
dest_path = sys.argv[2]

logging.info("Initializing, args: src_uri [%s] dest_path[ [%s]" % (src_uri, dest_path))
Storage.download(src_uri, dest_path)

logging.info("decrypting the model...")
out = subprocess.check_output(['/bin/ls', dest_path])
logging.info(out)
