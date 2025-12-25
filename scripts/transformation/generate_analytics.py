from sqlalchemy import create_engine
import pandas as pd

engine = create_engine(
    "postgresql+psycopg2://postgres:Lalitha%401408@localhost:5432/ecommerce_dw"
)

queries = {
    "monthly_revenue": "SELECT * FROM analytics.monthly_revenue;",
    "payment_split": "SELECT * FROM analytics.payment_split;"
}

for name, query in queries.items():
    df = pd.read_sql(query, engine)
    df.to_csv(f"data/analytics/{name}.csv", index=False)

print("Analytics CSVs generated successfully")
