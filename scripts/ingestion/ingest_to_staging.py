import pandas as pd
import yaml
from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL

# Load config
with open("config/config.yaml") as f:
    config = yaml.safe_load(f)

db = config["database"]

DB_URL = URL.create(
    drivername="postgresql+psycopg2",
    username=db["user"],
    password=db["password"],
    host=db["host"],
    port=db["port"],
    database=db["dbname"]
)

engine = create_engine(DB_URL)


def ingest():
    df = pd.read_csv("data/raw/sales_data.csv")

    # ✅ DROP sale_id because warehouse table doesn't have it
    if "sale_id" in df.columns:
        df = df.drop(columns=["sale_id"])

    with engine.begin() as conn:
        conn.execute(text("TRUNCATE TABLE warehouse.fact_sales;"))

        df.to_sql(
            "fact_sales",
            conn,
            schema="warehouse",
            if_exists="append",
            index=False
        )

    print("Ingestion completed successfully.")


if __name__ == "__main__":
    ingest()
