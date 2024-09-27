#!/usr/bin/env python3
import os
import sys
import logging
import subprocess

from kserve.storage import Storage

import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

if len(sys.argv) != 3:
    print("Usage: initializer-entrypoint src_uri dest_path")
    sys.exit()

src_uri = sys.argv[1]
dest_path = sys.argv[2]

model_path = f"{dest_path}/1"
key_file = f'keys/key.bin'
model_file = f'{model_path}/model.onnx'
encr_file = f'{model_file}.enc'
decr_file = f'{encr_file}.dec'

os.environ["S3_VERIFY_SSL"] = "0"
logging.info(os.getenv("S3_VERIFY_SSL"))

logging.info("Initializing, args: src_uri [%s] dest_path[ [%s]" % (src_uri, dest_path))
Storage.download(src_uri, dest_path)

logging.info("dest_path...")
out = subprocess.check_output(['/bin/ls', model_path])
logging.info(out)

logging.info("current_path...")
out = subprocess.check_output(['/bin/ls'])
logging.info(out)

logging.info("key...")
out =subprocess.check_output(['/bin/curl', '-L', 'http://127.0.0.1:8006/cdh/resource/default/kbsres1/key.bin', '-o', key_file])
logging.info(out)
out = subprocess.check_output(['/bin/ls'])
logging.info(out)

logging.info("fenc...")
out =subprocess.check_output(['/bin/fenc', '-file', encr_file, '-key', key_file, '-operation', 'decryption'])
logging.info(out)
out = subprocess.check_output(['/bin/ls', model_path])
logging.info(out)

logging.info("mv...")
out =subprocess.check_output(['mv', decr_file, model_file])
logging.info(out)
out = subprocess.check_output(['/bin/ls', model_path])
logging.info(out)

# logging.info("sleep...")
# subprocess.check_output(['sleep', '30'])