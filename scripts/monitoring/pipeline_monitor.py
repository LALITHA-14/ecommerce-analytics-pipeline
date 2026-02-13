import json
import os
import time
from datetime import datetime

METRICS_FILE = "logs/pipeline_metrics.json"

def record_pipeline_start():
    return {
        "pipeline_start_time": datetime.utcnow().isoformat(),
        "steps": {},
        "status": "running"
    }

def record_step(metrics, step_name, status, execution_time_ms):
    metrics["steps"][step_name] = {
        "status": status,
        "execution_time_ms": execution_time_ms
    }

def record_pipeline_end(metrics, final_status):
    metrics["pipeline_end_time"] = datetime.utcnow().isoformat()
    start = datetime.fromisoformat(metrics["pipeline_start_time"])
    end = datetime.fromisoformat(metrics["pipeline_end_time"])
    metrics["total_execution_time_seconds"] = (end - start).total_seconds()
    metrics["status"] = final_status

    os.makedirs("logs", exist_ok=True)
    with open(METRICS_FILE, "w") as f:
        json.dump(metrics, f, indent=4)
