import subprocess
import json
from datetime import datetime

STEPS = [
    ("Data Generation", "scripts/data_generation/generate_data.py"),
    ("Ingestion", "scripts/ingestion/ingest_to_postgres.py"),
    ("Analytics", "scripts/transformation/generate_analytics.py")
]

def run_pipeline():
    report = {"started_at": datetime.utcnow().isoformat(), "steps": {}}

    for name, script in STEPS:
        try:
            subprocess.run(["python", script], check=True)
            report["steps"][name] = "success"
        except Exception as e:
            report["steps"][name] = f"failed: {e}"
            break

    with open("logs/pipeline_execution_report.json", "w") as f:
        json.dump(report, f, indent=4)

if __name__ == "__main__":
    run_pipeline()
