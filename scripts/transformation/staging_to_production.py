import pandas as pd
from sqlalchemy import create_engine
import json
from datetime import datetime

DB_URL = "postgresql+psycopg2://postgres:Lalitha%401408@localhost:5432/ecommerce_dw"

def transform_and_load():
    engine = create_engine(DB_URL)

    df = pd.read_sql("SELECT * FROM staging.sales_data", engine)

    initial_rows = len(df)

    # --- Data cleansing ---
    df = df.dropna(subset=["customer_id", "product_id"])
    df["country"] = df["country"].str.title()
    df["payment_type"] = df["payment_type"].str.upper()

    # --- Derived metrics ---
    df["profit"] = df["revenue"] - (df["price"] * df["quantity"])
    df["price_category"] = pd.cut(
        df["price"],
        bins=[0, 50, 200, 1000],
        labels=["Budget", "Mid", "Premium"]
    )

    # --- Load to production ---
    df.to_sql(
        "fact_sales_production",
        engine,
        schema="warehouse",
        if_exists="replace",
        index=False
    )

    # --- Summary ---
    summary = {
        "timestamp": str(datetime.now()),
        "rows_before": initial_rows,
        "rows_after": len(df),
        "rejected_rows": initial_rows - len(df)
    }

    with open("data/analytics/etl_summary.json", "w") as f:
        json.dump(summary, f, indent=4)

    print("Production ETL completed successfully")

if __name__ == "__main__":
    transform_and_load()
