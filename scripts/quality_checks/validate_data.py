import psycopg2
import yaml

with open("config/config.yaml") as f:
    config = yaml.safe_load(f)

db = config["database"]

conn = psycopg2.connect(
    dbname=db["dbname"],
    user=db["user"],
    password=db["password"],
    host=db["host"],
    port=db["port"]
)

cur = conn.cursor()

cur.execute("""
SELECT COUNT(*) FROM warehouse.fact_sales;
""")

count = cur.fetchone()[0]

if count == 0:
    raise Exception("Validation failed: No records found!")

print(f"Data Validation successful. Rows found: {count}")

cur.close()
conn.close()
