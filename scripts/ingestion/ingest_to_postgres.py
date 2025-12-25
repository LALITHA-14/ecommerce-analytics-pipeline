import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

DB_URL = URL.create(
    drivername="postgresql+psycopg2",
    username="postgres",
    password="Lalitha@1408",
    host="localhost",
    port=5432,
    database="ecommerce_dw"
)

def ingest():
    df = pd.read_csv("data/raw/sales_data.csv")
    engine = create_engine(DB_URL)

    df.to_sql(
        "fact_sales",
        engine,
        schema="warehouse",
        if_exists="replace",
        index=False
    )

if __name__ == "__main__":
    ingest()
