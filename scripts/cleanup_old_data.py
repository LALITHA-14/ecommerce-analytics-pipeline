import os
import time

RETENTION_DAYS = 7
BASE_PATH = "data/processed/analytics"

now = time.time()

for file in os.listdir(BASE_PATH):
    path = os.path.join(BASE_PATH, file)
    if os.stat(path).st_mtime < now - RETENTION_DAYS * 86400:
        os.remove(path)
