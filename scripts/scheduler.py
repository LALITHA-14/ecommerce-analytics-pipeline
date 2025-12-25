import schedule
import time
from pipeline_orchestrator import run_pipeline

schedule.every().day.at("02:00").do(run_pipeline)

while True:
    schedule.run_pending()
    time.sleep(60)
