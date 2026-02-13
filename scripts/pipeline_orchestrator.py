import subprocess
import json
from datetime import datetime, UTC
import os

STEPS = [
    ("Data Generation", "scripts/data_generation/generate_data.py"),
    ("Ingestion", "scripts/ingestion/ingest_to_staging.py"),
    ("Data Validation", "scripts/quality_checks/validate_data.py"),
    ("Transformation", "scripts/transformation/staging_to_production.py"),
]

os.makedirs("logs", exist_ok=True)


def run_pipeline():
    report = {
        "started_at": datetime.now(UTC).isoformat(),
        "steps": {}
    }

    for name, script in STEPS:
        print(f"\nRunning: {name}")

        try:
            subprocess.run(["python", script], check=True)
            report["steps"][name] = "success"

        except Exception as e:
            report["steps"][name] = f"failed: {e}"
            break

    report["completed_at"] = datetime.now(UTC).isoformat()

    with open("logs/pipeline_execution_report.json", "w") as f:
        json.dump(report, f, indent=4)

    print("\nPipeline execution finished.")


if __name__ == "__main__":
    run_pipeline()
